class Book < Product
    attr_accessor :author, :pages

    def initialize(attributes = {})
        super
        @author = attributes[:author]
        @pages = attributes[:pages]
    end

    def display
        super
        puts "Autor: #{author}" if author
        puts "Páginas: #{pages}" if pages
    end

    def read
        puts "Lendo livro"
    end

    def open(page = nil)
        if  page
            if page > pages
                puts "O livro possui apenas #{pages} páginas."
            else
                puts "Abrindo na página #{page}"
            end
        else
            puts "Abrindo o livro"
        end
    end
end 