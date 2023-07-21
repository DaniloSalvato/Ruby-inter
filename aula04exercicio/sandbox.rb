array = (1..10).to_a
p array.inspect

array.push(11)
array.push(12)
p array

array.shift
p array

p array.include?(5)
p array.(5)

hash = {nome: 'Danilo', idade:'23', curso: 'ADS'}

hash[:semestre] = 2

p hash

hash.delete(:curso)

p hash

p hash.include?(:idade)
p hash.key?(:idade)
