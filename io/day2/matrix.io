Matrix := List clone do (
    dim := method(x, y, 
        self x := x
        self y := y
        for(i, 0, y, 
            inner := List clone
            for(ii, 0, x, inner push(nil))
            self push(inner)
        )
    )
    
    set := method(x, y, value,
        self at(y) atPut(x, value)
    )

    get := method(x, y,
        self at(y) at(x)
    )
    
    transpose := method(
        newMatrix := self clone
        newMatrix dim(self y, self x)
        for(ix, 0, self x,
            for(iy, 0, self y,
                newMatrix set(iy, ix, self get(ix, iy))
            )
        )
        newMatrix
    )
)

m := Matrix clone
m dim(10, 5)
writeln(m)
m set(2, 2, "test")
writeln(m get(2, 2))

m set(1, 5, "foo")

tm := m transpose

writeln(m get(1, 5))
writeln(tm get(5, 1))



