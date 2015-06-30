var search_data = {"index":{"searchIndex":["enemsolicitacao","gateway","session","gatewaytest","sessiontest","agent()","gateway()","gateway()","last_result()","new()","new()","password()","password=()","path()","search_by_cpf()","search_by_registry()","session()","site()","test_does_not_log_invalid_user_in()","test_gets_candidate_info()","test_gets_candidate_info_by_cpf()","test_logs_user_in()","user()","user=()","year()","year=()","gemfile","gemfile.lock","readme","rakefile","console","enem_solicitacao.gemspec"],"longSearchIndex":["enemsolicitacao","enemsolicitacao::gateway","enemsolicitacao::session","gatewaytest","sessiontest","enemsolicitacao::session#agent()","enemsolicitacao::gateway()","gatewaytest#gateway()","enemsolicitacao::gateway#last_result()","enemsolicitacao::gateway::new()","enemsolicitacao::session::new()","enemsolicitacao::password()","enemsolicitacao::password=()","enemsolicitacao::path()","enemsolicitacao::gateway#search_by_cpf()","enemsolicitacao::gateway#search_by_registry()","enemsolicitacao::session()","enemsolicitacao::site()","sessiontest#test_does_not_log_invalid_user_in()","gatewaytest#test_gets_candidate_info()","gatewaytest#test_gets_candidate_info_by_cpf()","sessiontest#test_logs_user_in()","enemsolicitacao::user()","enemsolicitacao::user=()","enemsolicitacao::year()","enemsolicitacao::year=()","","","","","",""],"info":[["EnemSolicitacao","","EnemSolicitacao.html","","<p>O EnemSolicitacao em Ruby fornece uma forma de automatizar a busca por\nresultados no sistema do Inep: …\n"],["EnemSolicitacao::Gateway","","EnemSolicitacao/Gateway.html","","<p>Esta classe fornece uma interface para interagir com sistema Enem\nSolicitação. Com ela, é possível buscar …\n"],["EnemSolicitacao::Session","","EnemSolicitacao/Session.html","","<p>Representa uma sessão com o sistema do Inep. Precisa de um login e senha\npara autenticação, procedimento …\n"],["GatewayTest","","GatewayTest.html","",""],["SessionTest","","SessionTest.html","",""],["agent","EnemSolicitacao::Session","EnemSolicitacao/Session.html#method-i-agent","()","<p>Retorna um `agent` (objeto `Mechanize`). Autentica o usuário, caso ainda\nnão esteja autenticado.\n"],["gateway","EnemSolicitacao","EnemSolicitacao.html#method-c-gateway","()","<p>Cria e faz cache de um gateway.\n"],["gateway","GatewayTest","GatewayTest.html#method-i-gateway","()",""],["last_result","EnemSolicitacao::Gateway","EnemSolicitacao/Gateway.html#method-i-last_result","()","<p>Carrega e retorna o conteúdo do resultado da última busca efetuada.\n"],["new","EnemSolicitacao::Gateway","EnemSolicitacao/Gateway.html#method-c-new","(session, year = EnemSolicitacao.year)","<p>Construtor.\n\n<pre>`session`: Sessão para autenticação no sistema\n`year`: Ano de referência para as consultas.</pre>\n"],["new","EnemSolicitacao::Session","EnemSolicitacao/Session.html#method-c-new","(login, password)",""],["password","EnemSolicitacao","EnemSolicitacao.html#method-c-password","()",""],["password=","EnemSolicitacao","EnemSolicitacao.html#method-c-password-3D","(password)",""],["path","EnemSolicitacao","EnemSolicitacao.html#method-c-path","(path)","<p>Método auxiliar para montar URLs.\n"],["search_by_cpf","EnemSolicitacao::Gateway","EnemSolicitacao/Gateway.html#method-i-search_by_cpf","(*cpfs)","<p>Busca resultados pelo CPF. Retorna o conteúdo do arquivo gerado pelo\nsistema do Inep (formato CSV) em …\n"],["search_by_registry","EnemSolicitacao::Gateway","EnemSolicitacao/Gateway.html#method-i-search_by_registry","(*registries)","<p>Busca resultados pelo número de inscrição. Retorna o conteúdo do arquivo\ngerado pelo sistema do Inep …\n"],["session","EnemSolicitacao","EnemSolicitacao.html#method-c-session","()","<p>Cria e faz cache de uma sessão para com o site.\n"],["site","EnemSolicitacao","EnemSolicitacao.html#method-c-site","()","<p>URL do sistema do Inep.\n"],["test_does_not_log_invalid_user_in","SessionTest","SessionTest.html#method-i-test_does_not_log_invalid_user_in","()",""],["test_gets_candidate_info","GatewayTest","GatewayTest.html#method-i-test_gets_candidate_info","()",""],["test_gets_candidate_info_by_cpf","GatewayTest","GatewayTest.html#method-i-test_gets_candidate_info_by_cpf","()",""],["test_logs_user_in","SessionTest","SessionTest.html#method-i-test_logs_user_in","()",""],["user","EnemSolicitacao","EnemSolicitacao.html#method-c-user","()",""],["user=","EnemSolicitacao","EnemSolicitacao.html#method-c-user-3D","(user)",""],["year","EnemSolicitacao","EnemSolicitacao.html#method-c-year","()","<p>Ano de referência padrão. Se não configurado, será utilizado o ano\nanterior.\n"],["year=","EnemSolicitacao","EnemSolicitacao.html#method-c-year-3D","(year)",""],["Gemfile","","Gemfile.html","","<p>source &#39;rubygems.org&#39;\n<p>gemspec\n"],["Gemfile.lock","","Gemfile_lock.html","","<p>PATH\n\n<pre>remote: .\nspecs:\n  enem_solicitacao (0.0.1)\n    mechanize</pre>\n<p>GEM\n"],["README","","README_md.html","","<p>Enem Solicitação\n<p>Esta pequena biblioteca serve para buscar um resultado do Enem no sistema\ndo INEP.\n<p>Configurando …\n"],["Rakefile","","Rakefile.html","","<p>require &#39;bundler&#39; Bundler::GemHelper.install_tasks\n<p>require &#39;rake/testtask&#39; require &#39;rdoc/task&#39; …\n"],["console","","console.html","","<p>#!/bin/bash\n<p>dotenv irb -Ilib -renem_solicitacao\n"],["enem_solicitacao.gemspec","","enem_solicitacao_gemspec.html","","<p>Gem::Specification.new do |s|\n\n<pre>s.name        = &#39;enem_solicitacao&#39;\ns.version     = &#39;0.0.1&#39;\ns.date       ...</pre>\n"]]}}