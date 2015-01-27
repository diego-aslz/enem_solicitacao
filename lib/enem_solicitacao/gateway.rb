module EnemSolicitacao
  class Gateway
    def initialize(session, options={})
      @session = session
    end

    def search_by_registry(registry, year = EnemSolicitacao.year)
      page = agent.get(EnemSolicitacao.path('/solicitacao/'\
        "resultado#{year}/numeroInscricao/solicitacaoPelaInternet.seam"))
      form = page.form_with(id: 'formularioForm')
      form.enctype = 'application/x-www-form-urlencoded'
      form['numerosInscricaoDecorate:numerosInscricaoInput'] = registry
      form['j_id131.x'] = 81
      form['j_id131.y'] = 23

      page = form.submit
      form = page.form_with(id: 'resultadoForm')
      form.enctype = 'application/x-www-form-urlencoded'
      form['j_id191.x'] = 72
      form['j_id191.y'] = 19
      page = form.submit

      fail 'Request problem' unless page.body['sucesso']
      last_result
    end

    def search_by_cpf(cpf, year = EnemSolicitacao.year)
      page = agent.get(EnemSolicitacao.path('/solicitacao/'\
        "resultado#{year}/cpf/solicitacaoPelaInternet.seam"))
      form = page.form_with(id: 'formularioForm')
      form.enctype = 'application/x-www-form-urlencoded'
      form['cpfDecorate:cpfInput'] = cpf
      form['j_id131.x'] = 81
      form['j_id131.y'] = 23

      page = form.submit
      form = page.form_with(id: 'resultadoForm')
      form.enctype = 'application/x-www-form-urlencoded'
      form['j_id191.x'] = 72
      form['j_id191.y'] = 19
      page = form.submit

      fail 'Request problem' unless page.body['sucesso']
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

    def agent
      @session.agent
    end
  end
end
