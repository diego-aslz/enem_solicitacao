module EnemSolicitacao
  class Session
    def initialize(login, password)
      @login    = login
      @password = password
      @agent    = Mechanize.new
      @agent.user_agent_alias = 'Linux Firefox'
    end

    def agent
      establish unless established?
      @agent
    end

    def established?
      @status == :established
    end

    private

    def login_url
      EnemSolicitacao.path '/login.seam'
    end

    def establish(login = @login, password = @password)
      login_page    = @agent.get(login_url)
      form          = login_page.form_with(id: 'formLogin')
      form.username = login
      form.password = password
      form['j_id19.x'] = 1
      form['j_id19.y'] = 1
      home_page     = @agent.submit(form)
      raise "Unable to authenticate #{login}" unless home_page.body['inicial']
      @status = :established
    end
  end
end
