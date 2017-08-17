class CreditCheck
  attr_reader :input
  def initialize
    @input = input 
  end

  def get_card_number
    @input = gets.chomp
  end

  def reverse_raw_cc_number
    @input.reverse
  end

  def split_reversed_cc_number
    split = reverse_raw_cc_number.split("")
  end

  def turn_split_array_into_integers
    split_reversed_cc_number.map do |number|
      number.to_i
    end
  end

  def double_every_other_number
    turn_split_array_into_integers.map.with_index do |number, index|
      if index.odd?
        number *= 2
      else
        number
      end
    end
  end

  def sum_digits_over_ten
    double_every_other_number.map do |number|
      if number > 9
        number - 9
      else
        number
      end
    end
  end

  def combine_all_numbers
    sum_digits_over_ten.inject { |sum, number| sum + number }
  end

  def determine_validity
    if combine_all_numbers % 10 == 0
      puts "The number is valid!"
    else
      puts "The number is invalid!"
    end
  end
end

card = CreditCheck.new
puts "Please enter your 14-15 digit CC #:"
card.get_card_number
card.reverse_raw_cc_number
card.split_reversed_cc_number
card.turn_split_array_into_integers
card.double_every_other_number
card.sum_digits_over_ten
card.combine_all_numbers
card.determine_validity
