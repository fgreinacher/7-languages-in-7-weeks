def grep(filename, pattern) 
  File.open(filename, 'r').each_with_index do |line, index| 
    puts "#{index + 1}: #{line}" if /#{pattern}/.match(line)
  end    
end

unless ARGV.count == 2
  puts "Usage: ruby simple_grep.rb <filename> <pattern>"
  exit 1
end

grep(ARGV[0], ARGV[1])
