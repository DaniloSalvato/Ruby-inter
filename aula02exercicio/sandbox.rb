require './modules/conversor'
require './modules/math-operation'
require './modules/currency-converter'
require './classes/calculator'

calculator = Calculator.new

calculator.inches_to_centimeters(10)
calculator.centimeters_to_inches(30)
calculator.sum(5, 7)
calculator.product(3, 4)

calculator.real_to_dollar(1)