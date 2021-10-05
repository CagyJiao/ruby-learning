# p004stringusage.rb
# Defining a constant
PI = 3.1415926
puts PI
# Defining a local variable
my_string = 'I love BUDAPEST?'
puts my_string

# Coversions
var1 = 5
var2 = '2'
puts var1 + var2.to_i

a = 'hello'
a<<'world'
puts a

a = <<END_STR
This is the string
...
END_STR
puts a