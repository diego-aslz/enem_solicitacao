# Enem Solicitação [![Build Status](https://travis-ci.org/nerde/enem_solicitacao.svg)](https://travis-ci.org/nerde/enem_solicitacao) [![Code Climate](https://codeclimate.com/github/nerde/enem_solicitacao/badges/gpa.svg)](https://codeclimate.com/github/nerde/enem_solicitacao) [![Test Coverage](https://codeclimate.com/github/nerde/enem_solicitacao/badges/coverage.svg)](https://codeclimate.com/github/nerde/enem_solicitacao/coverage)

Esta pequena biblioteca serve para buscar um resultado do Enem no sistema do INEP.

## Configurando Autenticação

Para o correto funcionamento, é necessário configurar um login e senha. Estes
são lidos das variáveis de ambiente ENEM_LOGIN e ENEM_PASSWORD
respectivamente. No entanto, é possível sobrescrever este comportamento:

```ruby
EnemSolicitacao.user     = 'meulogin'
EnemSolicitacao.password = 'minhasenha'
```

## Console

Ao usar a gem em modo standalone, há um console para deixar o ambiente
preparado. Para isso, clone o projeto, instale as dependências com `bundle`.

As configurações de autenticação serão lidas do arquivo `.env` no diretório
raiz do projeto. Este arquivo não entra no controle de versão por questões
de segurança. Duplique o arquivo de exemplo e configure sua autenticação:

```
cd /caminho/para/enem_solicitacao
cp .env_example .env
$EDITOR .env
```

Feita a configuração, basta rodar o console:

```
./console
```

Uma vez dentro dele, fazer consultas se torna trivial.

## Buscando Resultados

Por número de inscrição:

```ruby
EnemSolicitacao.gateway.search_by_registry(123456789012)
# => "123456789012;11111111111;AAAAAAAAA BBBBBBBBB CCCCCCCCC;610.9;639.5;596.4;580.4;700.0;7;7;7;7;7;01/01/1990;M;2222222;SSP;SC;PR;FOZ DO IGUACU;N;Espanhol;"
```

Por CPF:

```ruby
EnemSolicitacao.gateway.search_by_cpf('11111111111')
# => "123456789012;11111111111;AAAAAAAAA BBBBBBBBB CCCCCCCCC;610.9;639.5;596.4;580.4;700.0;7;7;7;7;7;01/01/1990;M;2222222;SSP;SC;PR;FOZ DO IGUACU;N;Espanhol;"
```

Ambos os métodos podem receber mais de um argumento de uma só vez e a busca
retornará os registros separados por linha. Porém, segundo o site, há um
limite de 20 registros para cada busca.

## Licença

MIT.
