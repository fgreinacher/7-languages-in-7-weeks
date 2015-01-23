import scala.io.Source

trait Censor {
    val alternatives = Source.fromFile(".alternatives").getLines().foldLeft(Map.empty[String, String]) {
         (acc, line) => acc + (line.split(" ")(0) -> line.split(" ")(1)) 
    }
    
    def censor(text: String) : String = {
        var censoredText = text
        alternatives.foreach(x => censoredText = censoredText.replace(x._1, x._2))
        censoredText
    }
}

class Message(val text: String) extends Censor {
    val censoredText = censor(text)
}

val msg = new Message("Gosh Darn It! Shoot!")
println(msg.text)
println(msg.censoredText)
