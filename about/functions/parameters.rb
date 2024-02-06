require 'test/unit'

class ParametersTest < Test::Unit::TestCase

  def test_default_parameter
    def go(action = "sleep")
      action
    end

    assert_equal(go("wake up"), "wake up")
    assert_equal(go, "sleep")
  end

  def test_nil_does_not_trigger_default_value
    def go(action = "sleep")
      action
    end

    assert_equal(go(nil), nil)
  end

  
end