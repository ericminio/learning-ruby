require 'test/unit'

class FindTest < Test::Unit::TestCase

  def test_find_returns_the_first_element_that_matches_the_condition
    array = [1, 2, 3, 4, 5]
    result = array.find { |n| n > 3 }
    
    assert_equal(result, 4)
  end

  def test_find_stops_at_first_match
    a = ""
    array = [1, 2, 3, 4, 5]
    result = array.find { |n| 
      a += n.to_s
      n > 3 
    }

    assert_equal(a, "1234")
  end
end