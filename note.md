# Ruby-Learning

Run the ruby program: `ruby xxx.rb`

- When you run a Ruby application, an object called **main** of class **Object** is automatically created. This object provides access to the **Kernel** methods.

- The Ruby coding convention states that file/directory name is lower case of class/module name with .rb extension. For example, Foo class has name foo.rb

**Comments**: use `#` to comment one line, `=begin` and `=end` can work on large block



`puts` could print string, 's' means string, e.g.

```ruby
puts 'Hello'
```



parentheses are optional with a method call:

- `foobar`
- `foobar()`
- `foobar(a, b, c)`
- `foobar a, b, c`



## Numbers

Integers: without decimal points

Floating-point numbers(float): with decimal

And ruby will ignore the underscore, like 1_000_000

If the operation is integer and integer, the result will be integer also. If there is float, the result will be float.

**Class Heirarchy**

<img src="http://rubylearning.com/images/class.png" alt="class" style="zoom:67%;" />

**Operators**

<img src="http://rubylearning.com/images/operators.jpg" alt="operators" style="zoom:75%;" />

In Ruby, **the sign of the result (for % operator) is always the same as the sign of the second operand.**

Both **or** and **||** return their first argument unless it is **false**, the only difference between **or** and **||** is their precedence. **||** has a higher precedence than **or**.

Common idiom to use ||

```ruby
@variable = @variable || "default value"
# or
@variable ||= "default value"
```



## Strings

we can use single or double quotation marks in Ruby, but single quotation is much more efficient. The back-tick(`) is also fine, but it will be sent to the OS as a command to be executed

```ruby
puts `ls`
```

Also, using the Kernel method `system` could executes the given command in a sub-process. If it is return `true`, the command was found and executede properly; Else, return `false`. 

```ruby
system("tar xzf test.tgz")
```

- In Ruby, strings are **mutable**. Ruby stores a string as a sequence of characters.
- In single-quoted strings, a backslash is not special if the character that follows it is anything other than a quote or a backslash. For example 'a\b' and 'a\\b' are equal.
- 



**Common methods**

- **reverse**: gives a backwards version of a string, does not change the origin one
- **length**: return the number of characters
- **upcase**: changes every lowercase letter to uppercase
- **downcase**: changes every uppercase lettter to lowercase
- **swapcase**: switches the case of very letter in the string
- **capitalize**: is just like **downcase**, it switches the first character to uppercase, if it is a letter
- **slice**: gives you a substring of a larger string
- Else?
  - **String.methods.sort** shows a list of methods that the class object String reponds to
  - **String.instance_methods.sort** shows all instance methods that instances of String endowed with
  - **String.instance_methods(false).sort** lists all instance methods without those of the class's ancestors 



**upcase**, **downcase**, **swapcase** and **capitalize** have corresponding methods that modify a string in place rather than creating a new one: **upcase!**, **downcase!**, **swapcase!** and **capitalize!**. 



**Comparing two strings**

- **==** test two string for identical content
- **eql?**  same as **==**\
- **equal?** tests whether two strings are the same object



**%w** creates an array withoud quotes and commas

```ruby
names1 = ['ann', 'richard', 'william', 'susan', 'pat']
names2 = %w{ ann richard william susan pat}
```





## Variables and Assignment



Conversions: `.to_i`, `.to_f`, `.to_s`

We can use `<<` to add strings, 

```ruby
a = 'hello'
a<<'world'
```

!!!: be careful, there are no empty spaces between variable and the assign, also the value.

Or use `<<END_STR` to write multi lines down,

```ruby
a = <<END_STR
This is the string
...
END_STR
```

!!!: be careful, there is no empty space between `<<` and `END_STR`



## Input

using the `gets` and `chomp` methods

```ruby
puts "In which city do you stay?"
STDOUT.flush
city = gets.chomp
puts "The city is " + city
```

- `STDOUT` is a global constant which is the actual standard output stream.
  - `flush` flushes any buffered data within io, it is not mandatory, but recommended
  - `STDOUT.sync = true` will allow you to have flushed Ruby based IO without `.flush` calls
  - `gets` get a single line of data from the standard input
  - `chomp` lets `gets` retrieves only strings from keyboard, actually it removes the '\n'





## Names

It refers to constants, variables, methods, classes and modules. The **first character** of a name helps Ruby to distinguish

- Variables: contain data of any type
  - **local**: consists of a lowercase letter or an underscore, e.g. _z, q\_p_f
  - **instance**: starts with an "at" sign(@), e.g. @sign, @_, @Counter
  - **class**: starts with two "at" signs, e.g. @@sign, @@_
  - **Global**: starts with a dollar sign("$"), e.g. $counter, $-x
- Constants: start with uppercase letter, e.g. module MyMath, PI = 3.14, class MyPune
- Method Names: begin with a lowercase letter or an underscore

In Ruby, everything you manipulate is an **object**

```ruby
'sjdlfahoi'.length 
5.times { puts "mice!\n" }

s = 'hello'
puts s.class
```





## Methods

Rules:

- no return type
- the method will return the value of the last statement in the method
- Recommended to leave a single blank line between the method definition
- the parentheses around a method's arguments are optional

```ruby
def hello
    'Hello'
end
puts hello

def hello1(name)
    'Hello ' + name
end
puts hello1('HHH')

def hello2 name2
    'Hello ' + name2
end
puts hello2('PPP')
puts(hello2 'WWW')
```

We can use the assignment operator to specify default values,

```ruby
def mtd(arg1="Dibya", arg2="Shashank", arg3="Shashank")
    "#{arg1}, #{arg2},  #{arg3}"
end
puts mtd
puts mtd("ruby")
```



**alias** can copy a method

```ruby
def oldmtd
    "old method"
end

alias newmtd oldmtd

def oldmtd
    "old improved method"
end

puts oldmtd  # old improved method
puts newmtd  # old method
```



use * to define variable number of parameters,

```ruby
def foo(*my_string)
    my_string.inspect
end

puts foo('hello', 'world')  # ["hello", "world"]
puts foo  # []
```

which actually takes all arguments to assign to an **array**.

The sequence of putting the parameters on to the stack is **left to right**,

```ruby
def mtd(a=99, b=a+1)
    [a, b]
end
puts mtd  # 99 100
```



The parameters passed by **value** only! But, we can use **!** to passed by reference!

```ruby
def downer(string)  
  string.downcase  
end  
a = "HELLO"  
downer(a)      # -> "hello"  
puts a         # -> "HELLO"  
  
def downer(string)  
  string.downcase!  
end  
a = "HELLO"  
downer(a)      # -> "hello"  
puts a         # -> "hello" 
```

Bang (!) Methods can modify an object in-place, but by convention, the bang labels a method as dangerous. Examples of such pairs of methods include **sort/sort!** for arrays, **upcase/upcase!** for strings, **chomp/chomp!** for strings, and **reverse/reverse!** for strings and arrays. In each case, if you call the non-bang version of the method on the object, you get a new object. If you call the bang version, you operate in-place on the same object to which you sent the message.



## ri and RDoc

Ruby Index, aka. ri. Ruby Documentation, aka. RDoc.

**ri** is a command-line tool, and RDoc system includes the command-line tool **rdoc**.

**rdoc** can scan your files, extracts the comments and organizes them intelligently, and creates nicely formatted documentation from them.

**ri** is used to view the Ruby documentation off-line, enter **ri** and the name of method, class and module, then it will list the details. If a class defines a class emthod and an instance method by the same name, you must instead use :: to refer to a class method or # to refer to the instance method.

```bash
ri Array
ri Array.sort
ri Hash#each
ri Math::sqrt
```

 

## Constructs



**control flow**

```ruby
var = 5
if var > 4
    puts "var is greater than 4"
    if var == 5
        puts "Also it is a 5"
    elsif var == 6
      	puts "it is a 6"
    else
        puts "it is not a 5"
    end
else
    puts "var is less or equal than 4"
end
```

**unless** as a statement is the opposite of **if**, it executes if an associated expression evalutes to false or nil

```ruby
unless ARGV.length == 2
	puts "Usage: program.rb 23 45"
	exit
end
```



**while**

```ruby
var = 0
while var < 10
    puts var
    var += 1
end
```



**Conditional ? :**

(condition) ? (result **if** condition is **true**) : (result **if** condition is **false**) 

```ruby
age = 15
puts (13..19).include?(age) ? "teenager" : "not a teenager"
```



**Statement modifiers**

In Ruby, we can use **if** or **unless** to make a single expression 

```ruby
puts "Enrollments will now stop" if participants > 2500
```



**Case Expressions**

```ruby
year = 2000  
leap = case  
       when year % 400 == 0 then true  
       when year % 100 == 0 then false  
       else year % 4   == 0  
       end  
puts leap  
# output is: true 
```



**Diff between FALSE and NIL**

```ruby
# We can determine our object's class and its unique object ID  
# NIL is synonym for nil  
puts NIL.class # NilClass  
puts nil.class # NilClass  
puts nil.object_id # 4  
puts NIL.object_id # 4  
  
# FALSE is synonym for false  
puts FALSE.class # FalseClass  
puts false.class # FalseClass  
puts false.object_id # 0  
puts FALSE.object_id # 0  
```





## Blocks

it is called closures in other languages. In Ruby, between braces or between **do..end**. 

Usually, using braces for one-line and using do..end for multi-line

```ruby
greet { puts 'Hello' }

greet_para("PuneRuby") { puts 'Hello' }
```



Also, we could assign the blocks into method, using **yield** to call it,

```ruby
def call_block  
    puts 'Start of method'  
    # you can call the block using the yield keyword  
    yield  
    yield  
    puts 'End of method'  
end  
# Code blocks may appear only in the source adjacent to a method call  
call_block {puts 'In the block'} 
# Output:
# Start of method  
# In the block  
# In the block  
# End of method 
```

Also, we can add parameters in **yield**

```ruby
def call_block  
  yield('hello', 99)  
end  
call_block {|str, num| puts str + ' ' + num.to_s}  
```

And **block_given?** could check whether there is a block given or not,

```ruby
def call_block
    yield('hello', 88)
end
call_block {|str, num| puts str + ' ' + num.to_s}

def try
    if block_given?
        yield
    else
        puts "no block"
    end
end
try
try { puts "hello" }
try do puts "hello" end
```



**Block variables**

```ruby
x = 10  
5.times do |x|  
  puts "x inside the block: #{x}"  # 0..4
end  
  
puts "x outside the block: #{x}"  # 10
```









