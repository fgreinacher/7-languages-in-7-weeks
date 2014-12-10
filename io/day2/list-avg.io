List avg := method(

    sum := 0
    self foreach(item,
        if(item isKindOf(Number) == false,
            Exception raise("All items must be numbers")
        ) 
        sum = sum + item
    )
    sum / self size
)

goodList := list(1,2,3,4,5,6)
writeln(goodList)
writeln("Average = ", goodList avg)

badList := list(1,2,"x",4,5,6)
writeln(badList)
writeln("Average = " badList avg)

