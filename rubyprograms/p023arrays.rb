
# Empty array
var1 = []
puts var1[0]

flavour = 'mango'
var2 = [80.5, flavour, [true, false]]
puts var2[1]

var3 = ['a', 2, 'jack']
var3[0] = 99
var3[2] = [5, 2, 3]
puts var3

puts var3[2].sort
puts var3.length
puts var3.first
puts var3.last

locations = ['Miami', 'Chicago', 'New York']
locations.each do |loc|
    puts 'I love ' + loc + '!'
end

locations.delete('Miami')
puts locations

a = 1, 2, 3, 4
b = [1, 2, 3, 4]
puts a

