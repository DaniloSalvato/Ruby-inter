class Regex 
    def switch_word(string)
        new_word = string.gsub("Python", "Ruby")
        puts new_word
    end

    def verify_word(string)
        if string.include?('programar')
        puts "Tem programar na string"
        end
    end

    def reverse_sentence(string)
        new_sentence = string.reverse
        puts new_sentence
    end

    def split_sentence(string)
        array = string.split(",")
        p array
    end
    
    def concat_sentence(string1, string2)
        array = string1 + " " + string2
        p array
    end
end

regex = Regex.new

string = "Eu amo programar em Python!"
string1 = "Lorem ipsum dolor sit amet"
string2 = "Ruby,Python,Java,JavaScript"
string3 = "Hello"
string4 = "world"

regex.switch_word(string)
regex.verify_word(string)
regex.reverse_sentence(string1)
regex.split_sentence(string2)
regex.concat_sentence(string3, string4)

