module Adressable
    def validate_address
        puts "Sem rua" unless address[:public_area]
        puts "Sem numero" unless address[:number]
        puts "Sem bairrp" unless address[:district]
        puts "Sem cidade" unless address[:city]
        puts "Sem estado" unless address[:federal_state]
        puts "Sem CEP" unless address[:zip_code]
    end
    
    def full_address
        "#{public_area}, #{number}, #{district}, #{city}, #{federal_state}, #{zip_code}"
    end

    def public_area
        address[:public_area]
    end

    def number
        address[:number]
    end

    def district
        address[:district]
    end

    def city
        address[:city]
    end

    def federal_state
        address[:federal_state]
    end

    def zip_code
        address[:zip_code]
    end
end