# dynamic type
x = 7
x = "house"
x = 7.5

# everything is an object
'sjdlfahoi'.length 

puts Float::DIG

puts Float::MAX

rice_on_square = 1
64.times do |square|
    puts "On Square #{square + 1} are #{rice_on_square} grain(s)"
    rice_on_square *= 2
end

s = 'hello'
puts s.class

puts 'I am in class: ' + self.class.to_s
puts 'I am an object: ' + self.to_s
puts self.private_methods.sort

5.times { puts "mice!\n" }