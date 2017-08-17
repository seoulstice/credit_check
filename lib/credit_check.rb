class CreditCard
  attr_reader :card_num
  def initialize(card_num)
    @card_num = card_num
  end

  def reverse_number(card_num)
    card_num.reverse
  end

  def split_reversed(number)
    array = number.split(//)
  end

  def array_to_integer(split_array)
    split_array = split_array.map do |num|
      num.to_i
    end
  end

  def double_values(split_array)
    new_values = []
    split_array.each_with_index do |value, index|
      if index.odd?
        new_values << value * 2
      else index.even?
        new_values << value
      end
    end
    new_values
  end

  def sum_digits_over_ten(double_values)
    new_values = []
    double_values.each do |number|
      if number > 9
        new_values << number - 9
      else
        new_values << number
      end
    end
    new_values
  end

  def sum_array(new_values)
    new_values.inject(:+)
  end

  def check_card_validity(card_sum)
    if card_sum % 10 == 0
      "The number is valid!"
    else
      "The number is invalid!"
    end
  end
end
