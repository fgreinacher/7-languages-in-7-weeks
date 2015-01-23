import scala.io._
import scala.actors._
import Actor._

def pageSize(url: String) = Source.fromURL(url).mkString.length

def printPageSizes(urls: Iterable[String]) = {
    for(url <- urls) {
        println("Loading " + url + "...")
        val ps = pageSize(url)
        println(url + " -> " + ps)
    }
}

val urls = List("https://www.facebook.com", "https://www.twitter.com", "https://www.linkedin.com")

printPageSizes(urls)
