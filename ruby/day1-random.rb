
num = rand(10)
puts "Guess a number from 0 to 9"

while true
  guess = gets.to_i

  if guess == num
    puts "Correct"
    break
  elsif guess < num
    puts "Too low"
  elsif guess > num
    puts "Too high"
  end   
end

