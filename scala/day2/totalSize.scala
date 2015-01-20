def totalSize(strings: Iterable[String]) : Int = {
    strings.foldLeft(0)((acc,x) => acc + x.size)
}

