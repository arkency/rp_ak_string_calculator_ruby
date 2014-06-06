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

  def test_newline_as_delimeter
    assert_equal(6, add("1\n2,3"))
  end

  def test_exchanged_one_delimeter
    text = <<-INPUT.strip
//;
123;456
789
    INPUT
    assert_equal(123+456+789, add(text))
  end

  def test_exchanging_delimiter_disables_comma
    "|[]{};:,.<>/?-_=+!@$%^&*#".each_char do |delimeter|
      text = <<-INPUT.strip
//#{delimeter}
123;456,789
      INPUT
      assert_equal(123+456, add(text), "'#{delimeter}' didn't disable comma")
    end
  end

  #def test_two_delimeters_by_default
  #  assert_equal(1+2+3, add("1\n2,3;4"))
  #end
  #
  #def test_number_as_separator
  # ???
  #end

  def add(expression)
    StringCalculator.new.add(expression)
  end
end


class StringCalculator
  def add(expression)
    separators = if expression.start_with?("//;")
      /(\s|;)/
    else
      /(\s|,)/
    end
    expression.split(separators).map(&:to_i).inject(0, :+)
  end
end

