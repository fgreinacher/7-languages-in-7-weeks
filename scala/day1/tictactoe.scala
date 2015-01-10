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
    def row1() = Iterable(cells._1._1, cells._1._2, cells._1._3)
    def row2() = Iterable(cells._2._1, cells._2._2, cells._2._3)
    def row3() = Iterable(cells._3._1, cells._3._2, cells._3._3)
    
    def col1() = Iterable(cells._1._1, cells._2._1, cells._3._1)
    def col2() = Iterable(cells._1._2, cells._2._2, cells._3._2)
    def col3() = Iterable(cells._1._3, cells._2._3, cells._3._3)
    
    def dia1() = Iterable(cells._1._1, cells._2._2, cells._3._3)
    def dia2() = Iterable(cells._3._1, cells._2._2, cells._1._3)

    def lines() = Iterable(row1(), row2(), row3(), col1(), col2(), col3(), dia1(), dia2())

    def occupies(player: Player, cells: Iterable[Cell]) = cells.forall(_ == OccupiedCell(player))

    def won(player: Player) = lines().exists(occupies(player, _))

    def state() : State = {
        if(won(Player1)) return Won(Player1)
        else if(won(Player2)) return Won(Player2)
        else return Running
    }

    override def toString() = 
        Iterable(
            row1().mkString(" | "),
            row2().mkString(" | "),
            row3().mkString(" | ")
        ).mkString("\n")
}

var cells = (
    (OccupiedCell(Player1),     EmptyCell,              OccupiedCell(Player1)),
    (EmptyCell,                 OccupiedCell(Player1),  EmptyCell),
    (EmptyCell,                 OccupiedCell(Player2),  OccupiedCell(Player1))
)

var board = new Board(cells)
