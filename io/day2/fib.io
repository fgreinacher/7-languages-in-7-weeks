
Fib := Object clone

Fib.at := method(n,
    n switch (0, 0, 1, 1, Fib.at(n-1) + Fib.at(n-2))
)

writeln("Fib.at(0) = ", Fib.at(0))
writeln("Fib.at(1) = ", Fib.at(1))
writeln("Fib.at(4) = ", Fib.at(4))
