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