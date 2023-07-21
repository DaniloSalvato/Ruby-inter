module Conversor 
    def inches_to_centimeters(inches)
        centimeters = inches * 2.54
        puts "A conversão de polegadas para centimetros é: #{centimeters}cm"

    end

    def centimeters_to_inches(centimeters)
        inches = centimeters / 2.54
        puts "A conversão de centimetros para polegadas é: #{inches}in"
    end

end