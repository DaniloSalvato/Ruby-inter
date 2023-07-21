class Cachorro < Mamifero

    def initialize( attributes = {})
        super
    end

    def talk
        puts "O cachorro esta latindo"
    end
    
    def move
        puts "Esta andando"
    end
end
