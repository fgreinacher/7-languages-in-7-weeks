nums = (1..16).to_a

pending = []

nums.each do |x|
  pending.push(x)
  if pending.length == 4
    print pending
    puts  
    pending.clear
  end
end
