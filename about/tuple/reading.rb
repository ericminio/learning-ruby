require 'test/unit'

class DestructuringTest < Test::Unit::TestCase

  def test_reading_via_index
    a = 1, 2

    assert_equal(a[0], 1)
    assert_equal(a[1], 2)
    assert_equal(a, [1, 2])
  end

  
end