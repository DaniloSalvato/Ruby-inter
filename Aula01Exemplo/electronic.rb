class Electronic < Product
    attr_accessor :brand, :model, :power

    def initialize(attributes = {})
        super
        @brand = attributes[:brand]
        @model = attributes[:model]
        @power = false
    end

    def display
        super
        puts "Marca: #{brand}" if brand
        puts "Modelo: #{model}" if model
    end

    def turn_on
        if power
            puts "Aparelho já esta ligado"
        else
            @power = true
            puts "Ligando o aparelho"
        end
    end

    def turn_off
        if power
            @power = false
            puts "Aparelho desligado"
        else
            puts "Aparelho já esta desligado"
        end
    end

    def turn_on_security_mode
        turn_on
        puts "Aparelho ligado em modo de segurança."
    end

    def start_sale
        super
        puts "Produto de valor alto, atenção."
    end
end