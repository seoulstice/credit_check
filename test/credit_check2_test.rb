require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check2'
require 'pry'

class CreditCheckTest < Minitest::Test
  def test_it_exists
    card = CreditCheck.new

    assert_instance_of CreditCheck, card
  end
end
