module EnemSolicitacao
  # Esta classe fornece uma interface para interagir com sistema Enem
  # Solicitação. Com ela, é possível buscar resultados de candidatos.
  # Ela pode ser instanciada manualmente da seguinte maneira:
  #
  #     session = EnemSolicitacao::Session.new('login', 'password')
  #     gateway = EnemSolicitacao::Gateway.new(session, ano_referencia)
  #
  # No entanto, o recomendado é utilizar o objeto "global":
  #
  #     EnemSolicitacao.gateway
  #
  # Este último utiliza uma sessão global e a configuração geral de login e
  # senha. Veja a documentação de EnemSolicitacao para maiores detalhes.
  class Gateway
    attr_reader :year
    REGISTRY_KIND = 'numeroInscricao'
    CPF_KIND      = 'cpf'

    # Construtor.
    #     `session`: Sessão para autenticação no sistema
    #     `year`: Ano de referência para as consultas.
    def initialize(session, year = EnemSolicitacao.year)
      @session = session
      @year    = year
    end

    # Busca resultados pelo número de inscrição. Retorna o conteúdo do arquivo
    # gerado pelo sistema do Inep (formato CSV) em texto puro.
    def search_by_registry(*registries)
      request REGISTRY_KIND, 'numerosInscricaoDecorate:numerosInscricaoInput',
              registries.join(';')
    end

    # Busca resultados pelo CPF. Retorna o conteúdo do arquivo gerado pelo
    # sistema do Inep (formato CSV) em texto puro.
    def search_by_cpf(*cpfs)
      request  CPF_KIND, 'cpfDecorate:cpfInput', cpfs.join(';')
    end

    # Carrega e retorna o conteúdo do resultado da última busca efetuada.
    def last_result(retries: 5)
      while retries >= 0
        page = agent.get(EnemSolicitacao.path('/solicitacao/acompanhar'\
          'Solicitacao.seam'))
        result = {}
        page.search('table#listaSolicitacaoAtendidas tr').each do |row|
          cells = row.search('td').to_a
          next if cells.empty?
          unless cells[4].text['Fechado']
            # Solicitação em andamento, tentar novamente
            sleep 0.5
            retries -= 1
            continue
          end
          time, anchor = cells[2].text.strip, cells[4].search('a').first
          result[time] = anchor.attributes['href'].value
        end
        return agent.get(result[result.keys.max]).body.strip
      end
      fail 'Solicitação em processamento'
    end

    private

    def request(kind, field_id, value) # :nodoc:
      page = agent.get(EnemSolicitacao.path('/solicitacao/'\
        "resultado#{@year}/#{kind}/solicitacaoPelaInternet.seam"))
      form = page.form_with(id: 'formularioForm')
      form.enctype = 'application/x-www-form-urlencoded'
      form[field_id] = value
      form['j_id131.x'] = 81
      form['j_id131.y'] = 23
      page = form.submit

      form = page.form_with(id: 'resultadoForm')
      return unless form
      form.enctype = 'application/x-www-form-urlencoded'
      form['j_id191.x'] = 72
      form['j_id191.y'] = 19
      page = form.submit

      fail 'Request problem' unless page.body['sucesso']
      last_result
    end

    def agent # :nodoc:
      @session.agent
    end
  end
end
