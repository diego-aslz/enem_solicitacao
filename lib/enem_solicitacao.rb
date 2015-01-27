require 'mechanize'

# O EnemSolicitacao em Ruby fornece uma forma de automatizar a busca por
# resultados no sistema do Inep: EnemSolicitacao
# (http://sistemasenem.inep.gov.br/EnemSolicitacao).
#
# Para o correto funcionamento, é necessário configurar um login e senha. Estes
# são lidos das variáveis de ambiente ENEM_LOGIN e ENEM_PASSWORD
# respectivamente. Ao utilizar a gem em outro projeto, no entanto, é possível
# sobrescrever este comportamento:
#
#     EnemSolicitacao.user     = 'meulogin'
#     EnemSolicitacao.password = 'minhasenha'
#
# Feito isso, basta utilizar o gateway para fazer as buscas:
#
#     EnemSolicitacao.gateway
#
# Leia a documentação em `EnemSolicitacao::Gateway` para detalhes em como fazer
# as consultas.
module EnemSolicitacao
  VERSION = '0.0.1'

  # Ano de referência padrão. Se não configurado, será utilizado o ano anterior.
  def self.year
    @year ||= Date.today.year - 1
  end

  def self.year=(year)
    @year = year
  end

  # URL do sistema do Inep.
  def self.site
    'http://sistemasenem.inep.gov.br/EnemSolicitacao'
  end

  # Método auxiliar para montar URLs.
  def self.path(path)
    "#{site}#{path}"
  end

  def self.user=(user)
    @user = user
  end

  def self.user
    @user ||= ENV['ENEM_LOGIN']
  end

  def self.password=(password)
    @password = password
  end

  def self.password
    @password ||= ENV['ENEM_PASSWORD']
  end

  # Cria e faz cache de uma sessão para com o site.
  def self.session
    @session ||= Session.new(user, password)
  end

  # Cria e faz cache de um gateway.
  def self.gateway
    @gateway ||= Gateway.new(session)
  end
end

require 'enem_solicitacao/session'
require 'enem_solicitacao/gateway'
