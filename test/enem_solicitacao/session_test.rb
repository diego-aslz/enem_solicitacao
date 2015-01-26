require 'test_helper'

class SessionTest < Minitest::Unit::TestCase
  def test_logs_user_in
    VCR.insert_cassette 'test_logs_user_in'
    session = EnemSolicitacao::Session.new  EnemSolicitacao.user,
                                            EnemSolicitacao.password

    refute session.established?

    session.agent
    assert session.established?
    VCR.eject_cassette
  end

  def test_does_not_log_invalid_user_in
    VCR.insert_cassette 'test_does_not_log_invalid_user_in'
    session = EnemSolicitacao::Session.new '123', '123'
    refute session.established?

    assert_raises RuntimeError do
      session.agent
    end
    refute session.established?
    VCR.eject_cassette
  end
end
