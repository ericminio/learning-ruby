require 'test/unit'

class FindTest < Test::Unit::TestCase

  def test_any_is_true_when_any_element_matches
    array = [1, 2, 3, 4, 5]
    result = array.any? { |n| n == 3 }
    
    assert_equal(result, true)
  end

  def test_any_is_false_when_any_element_matches
    array = [1, 2, 4, 5]
    result = array.any? { |n| n == 3 }
    
    assert_equal(result, false)
  end

  def test_any_stops_at_first_match
    a = ""
    array = [1, 2, 3, 4, 5]
    result = array.any? { |n| 
      a += n.to_s
      n == 3 
    }

    assert_equal(a, "123")
  end
end