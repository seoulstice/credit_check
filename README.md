# Credit Check

## Summary
This repo is for a Turing School Back End Mod 1 project described in more detail [here](http://backend.turing.io/module1/projects/credit_check).

The intent of the project was to create an application that will take credit card number input from the user through the console and then validate that credit card number as authentic/not-authentic.  This is done by passing the number through a version of the Luhn Algorithim which verifies a number(in this case, a credit card number) against a check digit which is included as part of the credit card number.  In the case of credit card number validation, the number must pass these tests:

1. from the rightmost digit, which is the check digit, moving left, double the value of every second digit
2. if product of this doubling operation is greater than 9 (e.g., 7 * 2 = 14), then sum the digits of the products (e.g., 10: 1 + 0 = 1, 14: 1 + 4 = 5).
3. take the sum of all the digits
4. if and only if the total modulo 10 is equal to 0 then the number is valid

### How to Install

To install this application, first, 
