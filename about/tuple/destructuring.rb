require 'test/unit'

class DestructuringTest < Test::Unit::TestCase

  def test_destructuring_via_comma
    a, b = 1, 2

    assert_equal(a, 1)
    assert_equal(b, 2)
  end

  def test_destructuring_can_populate_first_value_only
    a, = 1, 2

    assert_equal(a, 1)
  end

  
end