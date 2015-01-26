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
end

require 'enem_solicitacao/session'
require 'enem_solicitacao/gateway'
