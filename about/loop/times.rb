require 'test/unit'

class TimesTest < Test::Unit::TestCase

  def test_times_returns_the_integer_on_which_it_is_called
    a = 3.times { }

    assert_equal(a, 3)
  end

  def test_times_provides_index_to_block
    a = ""
    3.times { |n| a += n.to_s }

    assert_equal(a, "012")
  end
end