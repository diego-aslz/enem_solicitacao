require 'test_helper'

class GatewayTest < Minitest::Unit::TestCase
  def gateway
    @gateway ||= EnemSolicitacao.gateway
  end

  def test_gets_candidate_info
    VCR.insert_cassette 'test_gets_candidate_info'

    assert_equal gateway.search_by_registry(123456789012), <<RESPONSE.strip
123456789012;11111111111;AAAAAAAAA BBBBBBBBB CCCCCCCCC;610.9;639.5;596.4;580.4;700.0;7;7;7;7;7;01/01/1990;M;2222222;SSP;SC;PR;FOZ DO IGUACU;N;Espanhol;
RESPONSE

    VCR.eject_cassette
  end
end