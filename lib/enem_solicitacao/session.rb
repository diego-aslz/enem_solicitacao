module EnemSolicitacao
  # Representa uma sessão com o sistema do Inep. Precisa de um login e senha
  # para autenticação, procedimento que só é executado quando uma busca é
  # realizada.
  class Session
    attr_reader :login, :password

    def initialize(login, password)
      @login    = login
      @password = password
      @agent    = Mechanize.new
      @agent.user_agent_alias = 'Linux Firefox'
    end

    # Retorna um `agent` (objeto `Mechanize`). Autentica o usuário, caso ainda
    # não esteja autenticado.
    def agent
      establish unless established?
      @agent
    end

    def established? # :nodoc:
      @status == :established
    end

    private

    def login_url # :nodoc:
      EnemSolicitacao.path '/login.seam'
    end

    # Faz a autenticação. Se ela não obtiver sucesso, uma exceção será
    # disparada.
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
