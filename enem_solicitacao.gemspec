Gem::Specification.new do |s|
  s.name        = 'enem_solicitacao'
  s.version     = '0.0.1'
  s.date        = '2015-01-23'
  s.summary     = 'Consultor do Enem Solicitação.'
  s.description = 'Este plugin fornece uma API de consulta ao sistema '\
                  'Enem Solicitação do INEP.'
  s.authors     = ['Diego Aguir Selzlein']
  s.email       = 'diego.selzlein@unila.edu.br'

  s.files         = Dir["README.md", "lib/**/*"]
  s.test_files    = Dir["test/**/*"]
  s.require_paths = ["lib"]

  s.homepage    = 'https://github.com/nerde/enem_solicitacao'
  s.license     = 'MIT'

  s.add_dependency 'mechanize'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'dotenv'
end
