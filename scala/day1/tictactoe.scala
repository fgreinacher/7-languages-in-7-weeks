sealed abstract class Player
case object Player1 extends Player
case object Player2 extends Player

sealed abstract class Cell
case object EmptyCell extends Cell
case class OccupiedCell(player: Player) extends Cell

class Board(cells: ( (Cell, Cell, Cell), (Cell, Cell, Cell), (Cell, Cell, Cell) )) {
    def firstRow() = Array(cells._1._1, cells._1._2, cells._1._2)

    override def toString() = cells.toString
}

var cells = (
    (EmptyCell,     EmptyCell,              OccupiedCell(Player1)),
    (EmptyCell,     EmptyCell,              EmptyCell),
    (EmptyCell,     OccupiedCell(Player2),  EmptyCell)
)

var board = new Board(cells)

println(board)
