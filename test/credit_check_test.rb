require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check'
require 'pry'

class CreditCardTest < Minitest::Test

  def test_it_exists
    card = CreditCard.new("4929735477250543")

    assert_instance_of CreditCard, card
  end



  def test_it_reverses_card_number
    card = CreditCard.new("4929735477250543")

    assert_equal "3450527745379294", card.reverse_number("4929735477250543")
  end

  def test_it_splits_card_into_array
    card = CreditCard.new("4929735477250543")

    card.reverse_number("4929735477250543")

    assert_equal ["3", "4", "5", "0", "5", "2", "7", "7", "4", "5", "3", "7", "9", "2", "9", "4"], card.split_reversed("3450527745379294")
  end

  def test_it_converts_array_to_integers
    card = CreditCard.new("4929735477250543")

    card.reverse_number("4929735477250543")
    card.split_reversed("3450527745379294")

    assert_equal [3, 4, 5, 0, 5, 2, 7, 7, 4, 5, 3, 7, 9, 2, 9, 4], card.array_to_integer(["3", "4", "5", "0", "5", "2", "7", "7", "4", "5", "3", "7", "9", "2", "9", "4"])
  end

  def test_it_doubles_values
    card = CreditCard.new("4929735477250543")

    card.reverse_number("4929735477250543")
    card.split_reversed("3450527745379294")
    card.array_to_integer(["3", "4", "5", "0", "5", "2", "7", "7", "4", "5", "3", "7", "9", "2", "9", "4"])
# binding.pry
    assert_equal [3, 8, 5, 0, 5, 4, 7, 14, 4, 10, 3, 14, 9, 4, 9, 8], card.double_values([3, 4, 5, 0, 5, 2, 7, 7, 4, 5, 3, 7, 9, 2, 9, 4])
  end

  def test_it_sums_integer_values_for_numbers_over_nine
    card = CreditCard.new("4929735477250543")

    card.reverse_number("4929735477250543")
    card.split_reversed("3450527745379294")
    card.array_to_integer(["3", "4", "5", "0", "5", "2", "7", "7", "4", "5", "3", "7", "9", "2", "9", "4"])
    card.double_values([3, 4, 5, 0, 5, 2, 7, 7, 4, 5, 3, 7, 9, 2, 9, 4])

    assert_equal [3, 8, 5, 0, 5, 4, 7, 5, 4, 1, 3, 5, 9, 4, 9, 8], card.sum_digits_over_ten([3, 8, 5, 0, 5, 4, 7, 14, 4, 10, 3, 14, 9, 4, 9, 8])
  end

  def test_it_can_sum_all_elements_in_array
    card = CreditCard.new("4929735477250543")

    card.reverse_number("4929735477250543")
    card.split_reversed("3450527745379294")
    card.array_to_integer(["3", "4", "5", "0", "5", "2", "7", "7", "4", "5", "3", "7", "9", "2", "9", "4"])
    card.double_values([3, 4, 5, 0, 5, 2, 7, 7, 4, 5, 3, 7, 9, 2, 9, 4])
    card.sum_digits_over_ten([3, 8, 5, 0, 5, 4, 7, 14, 4, 10, 3, 14, 9, 4, 9, 8])

    assert_equal 80, card.sum_array([3, 8, 5, 0, 5, 4, 7, 5, 4, 1, 3, 5, 9, 4, 9, 8])
  end

  def test_it_can_validate_real_credit_card
    card = CreditCard.new("4929735477250543")

    card.reverse_number("4929735477250543")
    card.split_reversed("3450527745379294")
    card.array_to_integer(["3", "4", "5", "0", "5", "2", "7", "7", "4", "5", "3", "7", "9", "2", "9", "4"])
    card.double_values([3, 4, 5, 0, 5, 2, 7, 7, 4, 5, 3, 7, 9, 2, 9, 4])
    card.sum_digits_over_ten([3, 8, 5, 0, 5, 4, 7, 14, 4, 10, 3, 14, 9, 4, 9, 8])
    card.sum_array([3, 8, 5, 0, 5, 4, 7, 5, 4, 1, 3, 5, 9, 4, 9, 8])

    assert_equal "The number is valid!", card.check_card_validity(80)
  end

end
