require './animal'
require './mamifero'
require './ave'
require './cachorro'
require './gato'

cachorro = Cachorro.new(name: 'Danilo')
# cachorro.talk

gato = Gato.new(name: 'Raul')
# gato.talk

passaro = Ave.new(name: 'piu piu')
# passaro.talk

def apresentar_animais(animal1, animal2, animal3)
    puts "Animal 1 - #{animal1.name}"
    animal1.talk
    animal1.move
    puts "Animal 2 - #{animal2.name}"
    animal2.talk
    animal2.move
    puts "Animal 3 - #{animal3.name}"
    animal3.talk
    animal3.move
end

apresentar_animais(cachorro, gato, passaro)
