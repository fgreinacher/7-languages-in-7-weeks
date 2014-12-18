Html := Object clone do (
    forward := method(
        name := call message name
        args := call message arguments

        writeStart(name)
        writeContents(args)
        writeEnd(name)
    )

    writeStart := method(name,
        writeln("<", name, ">")
    )

    writeContents := method(args,
        args foreach(arg,
            argv := self doMessage(arg);
            if(argv type == "Sequence", writeln(argv))
        )
    )

    writeEnd := method(name,
        writeln("</", name, ">")
    )
)

html := Html ul(li("ruby"), li("io"))
