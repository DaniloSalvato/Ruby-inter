array = (1..10).to_a
p array

array.push(11)
array.push(12)
p array

array.shift
p array

p array.include?(5)

hash = {nome: 'Danilo', idade:'23', curso: 'ADS'}

hash[:semestre] = 2

p hash

hash.delete(:curso)

p hash

p hash.include?(:idade)
