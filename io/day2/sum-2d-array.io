Matrix := Object clone

Matrix add := method(matrix, 
    sum := 0
    matrix foreach(arr,
        arr foreach(elem,
            sum = sum + elem
        )
    )
    sum
)

numbers := list(list(1,2), list(3,4), list(5,6), list(7,8), list(9,10))
writeln(numbers)
writeln("Sum = ", Matrix add(numbers))
