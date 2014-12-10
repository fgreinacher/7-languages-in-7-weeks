// store normal division operator
div := Number getSlot("/")

Number / := method(n, if(n == 0, 0, self div(n)))

writeln("10 / 0 = ", 10 / 0)
