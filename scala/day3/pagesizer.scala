import scala.io._
import scala.actors._
import Actor._

def printPageSizes(urls: Iterable[String]) = {
    val caller = self
    val linkPattern = """<a href="?([^ "]+)"?>""".r

    for(url <- urls) {
        actor {
            println("Processing " + url + "...")
            val contents = Source.fromURL(url).mkString
            val size = contents.size
            val links = linkPattern.findAllMatchIn(contents).map(_.group(1)).toList

            caller ! (url, size, links)
        }
    }

    for(i <- 1 to urls.size) {
        receive {
            case (url, size, links: List[String]) => {
                println("... processed " + url + " -> size: " + size + ", links: " + links.mkString(", "))
            }
        }
    }
}

val urls = List("https://www.facebook.com", "https://www.twitter.com", "https://www.linkedin.com")

printPageSizes(urls)
