:- include('concat.pl').

myRev(List, Result) :- doAccRev(List, [], Result).
doRev([], Acc, Acc).
doRev([Head|Tail], Acc, Result) :- doRev(Tail, [Head|Acc], Result).

myMin(List, Min) :- List = [Head|_], doMin(List, Head, Min).
doMin([Head|Tail], CurMin, Min) :- Head < CurMin, doMin(Tail, Head, Min).
doMin([Head|Tail], CurMin, Min) :- Head >= CurMin, doMin(Tail, CurMin, Min).
doMin([], CurMin, CurMin).

mySort(List, Sorted) :- doSort(List, [], Sorted).
doSort([], Acc, Acc).
doSort([Head|Tail], Acc, Sorted):-
    pivoting(Head, Tail, Left, Right),
    doSort(Left, Acc, SortedLeft),
    doSort(Right, [Head|SortedLeft], Sorted).

pivoting(_,[],[],[]).
pivoting(H,[X|T],[X|L],G) :- X =< H, pivoting(H,T,L,G).
pivoting(H,[X|T],L,[X|G]) :- X > H, pivoting(H,T,L,G).
