-module(tic_tac_toe).
-export([state/1]).

state(Board) -> case validate_board(Board) of
    { valid, ValidBoard } -> case ValidBoard of
        [x,x,x, _,_,_, _,_,_] -> {winner,x};
        [_,_,_, x,x,x, _,_,_] -> {winner,x};
        [_,_,_, _,_,_, x,x,x] -> {winner,x};
        [x,_,_, _,x,_, _,_,x] -> {winner,x};
        [_,_,x, _,x,_, x,_,_] -> {winner,x};
        [x,_,_, x,_,_, x,_,_] -> {winner,x};
        [_,x,_, _,x,_, _,x,_] -> {winner,x};
        [_,_,x ,_,_,x, _,_,x] -> {winner,x};

        [o,o,o, _,_,_, _,_,_] -> {winner,o};
        [_,_,_, o,o,o, _,_,_] -> {winner,o};
        [_,_,_, _,_,_, o,o,o] -> {winner,o};
        [o,_,_, _,o,_, _,_,o] -> {winner,o};
        [_,_,o, _,o,_, o,_,_] -> {winner,o};
        [o,_,_, o,_,_, o,_,_] -> {winner,o};
        [_,o,_, _,o,_, _,o,_] -> {winner,o};
        [_,_,o ,_,_,o, _,_,o] -> {winner,o};

        _ -> ValidBoard
    end;
    { invalid, Message } -> { invalid, Message }
    
end.

validate_board(Board) -> if
    length(Board) /= 9 -> { invalid, "Board must have 9 cells" };
    true -> { valid, Board }
end.
