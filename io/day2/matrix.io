Matrix := Object clone


Matrix dim := method(x, y, 
    self outer := List clone
    for(i, 0, y, 
        inner := List clone
        for(ii, 0, x,
            inner push(nil)
        )
        self outer push(inner)
    )
)

Matrix set := method(x, y, value,
    self outer at(y) atPut(x, value)
)

Matrix get := method(x, y,
    self outer at(y) at(x)
)

m := Matrix clone
m dim(10, 5)
writeln(m)

m set(2,2,"test")
writeln(m get(2,2))
