def forLoopJavaStyle {
    for(i <- 0 until args.length) {
        println(args(i))
    }
}

def forLoopRubyStyle {
    args.foreach { arg => 
        println(arg)
    }
}

println("= for loops")
println("== java style")
forLoopJavaStyle
println("== ruby style")
forLoopRubyStyle
