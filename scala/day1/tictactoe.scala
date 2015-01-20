sealed abstract class Player
case object Player1 extends Player
case object Player2 extends Player

sealed abstract class Cell
case object EmptyCell extends Cell
case class OccupiedCell(player: Player) extends Cell

sealed abstract class State
case object Running extends State
case object Draw extends State
case class Won(player: Player) extends State

class Board(cells: ( (Cell, Cell, Cell), (Cell, Cell, Cell), (Cell, Cell, Cell) )) {
    val row1 = List(cells._1._1, cells._1._2, cells._1._3)
    val row2 = List(cells._2._1, cells._2._2, cells._2._3)
    val row3 = List(cells._3._1, cells._3._2, cells._3._3)
    
    val col1 = List(cells._1._1, cells._2._1, cells._3._1)
    val col2 = List(cells._1._2, cells._2._2, cells._3._2)
    val col3 = List(cells._1._3, cells._2._3, cells._3._3)
    
    val dia1 = List(cells._1._1, cells._2._2, cells._3._3)
    val dia2 = List(cells._3._1, cells._2._2, cells._1._3)

    val lines = List(row1, row2, row3, col1, col2, col3, dia1, dia2)
   
    def occupies(player: Player, cells: Iterable[Cell]) = cells.forall(_ == OccupiedCell(player))
    def won(player: Player) = lines.exists(occupies(player, _))

    def state() : State = {
        if(won(Player1)) return Won(Player1)
        else if(won(Player2)) return Won(Player2)
        else if(lines.flatten.contains(EmptyCell)) return Running
        else return Draw
    }

    override def toString() = 
        Iterable(
            row1.mkString(" | "),
            row2.mkString(" | "),
            row3.mkString(" | ")
        ).mkString("\n")
}

var player1Won = new Board ((
    (OccupiedCell(Player1),     EmptyCell,              OccupiedCell(Player1)),
    (EmptyCell,                 OccupiedCell(Player1),  EmptyCell),
    (EmptyCell,                 OccupiedCell(Player2),  OccupiedCell(Player1))
))

var draw = new Board((
    (OccupiedCell(Player1), OccupiedCell(Player2), OccupiedCell(Player1)),
    (OccupiedCell(Player1), OccupiedCell(Player2), OccupiedCell(Player2)),
    (OccupiedCell(Player2), OccupiedCell(Player1), OccupiedCell(Player1))
))

var running = new Board((
    (EmptyCell, OccupiedCell(Player2), OccupiedCell(Player1)),
    (OccupiedCell(Player1), OccupiedCell(Player2), OccupiedCell(Player2)),
    (OccupiedCell(Player2), OccupiedCell(Player1), OccupiedCell(Player1))
))
