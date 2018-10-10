greeting = ARGV.shift # get the first argument which is s agreeting
ARGV.each do |name| # go through the array and get the next argument which is the name and next the other
    puts "#{greeting} #{name}" # print the greeting (first argument) took it from shift and the name from array
end


