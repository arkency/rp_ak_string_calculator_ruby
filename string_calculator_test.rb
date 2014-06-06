require 'test/unit'

class CalculatorTest < Test::Unit::TestCase
  def test_empty_string_sums_up_to_zero
    assert_equal(0, add(""))
  end

  def test_one_number_sums_up_to_the_number
    assert_equal(1, add("1"))
  end

  def test_two_numbers_sums_up_to_their_sum
    assert_equal(1122, add("123,999"))
  end

  def test_more_numbers
    assert_equal(6, add("1,2,3"))
  end

                 
  def add(expression)
    StringCalculator.new.add(expression)
  end
end


class StringCalculator
  def add(expression)
    expression.split(",").map(&:to_i).inject(0, :+)
  end
end

