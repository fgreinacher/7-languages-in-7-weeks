import scala.io._
import scala.actors._
import Actor._

def pageSize(url: String) = Source.fromURL(url).mkString.length

def printPageSizes(urls: Iterable[String]) = {
    var caller = self
    
    for(url <- urls) {
        actor {
            println("Loading " + url + "...")
            caller ! (url,  pageSize(url))
        }
    }

    for(i <- 1 to urls.size) {
        receive {
            case (url, size) =>
                println(url + " -> " + size)
        }
    }
}

val urls = List("https://www.facebook.com", "https://www.twitter.com", "https://www.linkedin.com")

printPageSizes(urls)
