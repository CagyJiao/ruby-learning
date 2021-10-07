File.open('p011mtdstack.rb', 'r') do |f1|
    while line = f1.gets
        puts line
    end
end

File.open('test.rb', 'w') do |f2|
    f2.puts "Created by Cagy\n"
end