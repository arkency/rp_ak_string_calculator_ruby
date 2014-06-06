require 'test/unit'

class CalculatorTest < Test::Unit::TestCase
  def test_empty_string_sums_up_to_zero
    assert_equal(0, add(""))
  end

  def test_one_number_sums_up_to_the_number
    assert_equal(1, add("1"))
  end

  def add(expression)
    StringCalculator.new.add(expression)
  end
end


class StringCalculator
  def add(expression)
    Integer(expression) rescue 0
  end
end

