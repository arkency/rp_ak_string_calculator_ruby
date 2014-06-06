require 'test/unit'

class CalculatorTest < Test::Unit::TestCase
  def test_empty_string_sums_up_to_zero
    assert_equal(0, add(""))
  end

  def add(expression)
    StringCalculator.new.add(expression)
  end
end


class StringCalculator
  def add(expression)
    0
  end
end

