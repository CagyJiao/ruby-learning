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

