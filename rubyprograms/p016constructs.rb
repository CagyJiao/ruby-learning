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

unless var == 10
    puts "Good, the var is not 10"
    exit
end