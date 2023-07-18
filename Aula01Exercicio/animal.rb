class Animal 
    attr_accessor :name

    def initialize(attributes = {})
        @name = attributes[:name]
    end

    def talk
        puts "O animal esta falando"
    end

    def move
        puts "Esta se movendo"
    end
end 