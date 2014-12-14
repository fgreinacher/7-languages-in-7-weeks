Matrix := Object clone do (
    dim := method(x, y, 
        self x := x
        self y := y
        self data := List clone
        for(i, 0, y, 
            inner := List clone
            for(ii, 0, x, inner push(nil))
            self data push(inner)
        )
    )
    
    set := method(x, y, value,
        self data at(y) atPut(x, value)
    )

    get := method(x, y,
        self data at(y) at(x)
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

File with("matrix.data") open write(m serialized) close

m2 := doRelativeFile("matrix.data")

writeln(m get(1, 5), " => ", m2 get(1, 5))



