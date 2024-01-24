require 'test/unit'

class TimesTest < Test::Unit::TestCase

  def test_times_helps_to_iterate
    a = 3.times { 1 }

    assert_equal(a, 3)
  end
end