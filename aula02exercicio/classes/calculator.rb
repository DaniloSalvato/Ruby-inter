class Calculator
    include Conversor
    include MathOperation
    include CurrencyConverter

    def initialize(attributes = {})
        @num1 = attributes[:num1]
        @num2 = attributes[:num2]
    end
end

