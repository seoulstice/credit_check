require 'pry'

card_number = "4929735477250543"

valid = false

converted_card_number = card_number.split("") # card_number.to_s.chars
reverse_card_number = converted_card_number.reverse
reverse_indexed = reverse_card_number.map_with_index |x, index|
  x.to_i


binding.pry






# Your Luhn Algorithm Here

# Output
## If it is valid, print "The number is valid!"
## If it is invalid, print "The number is invalid!"
