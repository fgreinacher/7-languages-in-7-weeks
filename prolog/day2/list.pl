:- include('concat.pl').

recRev([], []).
recRev([Head|Tail], Result) :- recRev(Tail, RevTail), append(RevTail, [Head], Result).

accRev(List, Result) :- doAccRev(List, [], Result).
doAccRev([], Acc, Acc).
doAccRev([Head|Tail], Acc, Result) :- doAccRev(Tail, [Head|Acc], Result). 
