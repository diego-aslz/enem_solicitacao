module EnemSolicitacao
  class Gateway
    REGISTRY_KIND = 'numeroInscricao'
    CPF_KIND      = 'cpf'

    def initialize(session, year = EnemSolicitacao.year)
      @session = session
      @year    = year
    end

    def search_by_registry(*registries)
      submit_request REGISTRY_KIND,
                     'numerosInscricaoDecorate:numerosInscricaoInput',
                     registries.join(';')
      last_result
    end

    def search_by_cpf(*cpfs)
      submit_request CPF_KIND, 'cpfDecorate:cpfInput', cpfs.join(';')
      last_result
    end

    def last_result
      page = agent.get(EnemSolicitacao.path('/solicitacao/acompanhar'\
        'Solicitacao.seam'))
      table = page.search('table#listaSolicitacaoAtendidas').first
      result = {}
      table.search('tr').each do |tr|
        tds = tr.search('td').to_a
        next if tds.empty?
        result[tds[2].text.strip] = tds[4].search('a').first \
                                          .attributes['href'].value
      end
      agent.get(result.sort.last.last).body.strip
    end

    private

    def submit_request(kind, field_id, value)
      page = agent.get(EnemSolicitacao.path('/solicitacao/'\
        "resultado#{@year}/#{kind}/solicitacaoPelaInternet.seam"))
      form = page.form_with(id: 'formularioForm')
      form.enctype = 'application/x-www-form-urlencoded'
      form[field_id] = value
      form['j_id131.x'] = 81
      form['j_id131.y'] = 23
      page = form.submit

      form = page.form_with(id: 'resultadoForm')
      form.enctype = 'application/x-www-form-urlencoded'
      form['j_id191.x'] = 72
      form['j_id191.y'] = 19
      page = form.submit

      fail 'Request problem' unless page.body['sucesso']
    end

    def agent
      @session.agent
    end
  end
end
