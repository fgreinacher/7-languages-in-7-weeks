min := 0
max := 100
num := Random value(min, max) floor

while(true,
    writeln("Guess a number between ", min, " and ", max)
    input := File standardInput readLine asNumber
    if(input < num, writeln("-> more"))
    if(input > num, writeln("-> less"))
    if(input == num, writeln("-> bingo") break)
)
