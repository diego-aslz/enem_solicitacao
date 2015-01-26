require 'mechanize'

module EnemSolicitacao
  VERSION = '0.0.1'

  def self.year
    @year ||= Date.today.year - 1
  end

  def self.year=(year)
    @year = year
  end

  def self.site
    'http://sistemasenem.inep.gov.br/EnemSolicitacao'
  end

  def self.path(path)
    "#{site}#{path}"
  end

  def self.user=(user)
    @user = user
  end

  def self.user
    @user ||= ENV['VALID_LOGIN']
  end

  def self.password=(password)
    @password = password
  end

  def self.password
    @password ||= ENV['VALID_PASSWORD']
  end

  def self.session
    @session ||= Session.new(user, password)
  end

  def self.gateway
    @gateway ||= Gateway.new(session)
  end
end

require 'enem_solicitacao/session'
require 'enem_solicitacao/gateway'
