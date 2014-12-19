X := Object clone do (
    forward := method(
        name := call message name
        args := call message arguments

        writeElement(name, args)
    )

    oneIndent := "   "
    indent := ""

    writeElement := method(name, args,
        writeStartTag(name)
        writeContents(args)
        writeEndTag(name)
    )

    writeStartTag := method(name, 
        writeln(indent, "<", name, ">")
    )

    writeContents := method(args,
        prevIndent := indent
        indent = oneIndent .. indent
        args foreach(arg,
            argv := self doMessage(arg);
            if(argv type == "Sequence", writeln(indent, argv))
        )
        indent = prevIndent
        
    )

    writeEndTag := method(name,
        writeln(indent .. "</", name, ">")
    )
)

X   html(
        head(
            title("foo")
        ),
        body(
            h1("Hey there"),
            p("Hey ", em("cutie"), "!")
        )
    )

X   person(
        lastname("John"), 
        firstname("Doe")
    )
        
