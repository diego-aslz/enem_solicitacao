require 'test_helper'

class EnemSolicitacaoTest < MyTest
  def setup
    super
    EnemSolicitacao.instance_variable_set(:@session, nil)
  end

  def test_uses_given_user
    EnemSolicitacao.user = 'atestusershouldbeused'
    assert_equal EnemSolicitacao.session.login, 'atestusershouldbeused'
  end

  def test_uses_given_password
    EnemSolicitacao.password = 'atestpasswordshouldbeused'
    assert_equal EnemSolicitacao.session.password, 'atestpasswordshouldbeused'
  end

  def test_uses_given_year
    EnemSolicitacao.year = 1950
    assert_equal EnemSolicitacao.gateway.year, 1950
  ensure
    EnemSolicitacao.instance_variable_set(:@year, nil)
  end
end
