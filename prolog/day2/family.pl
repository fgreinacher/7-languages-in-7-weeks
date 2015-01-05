father(zeb, johnBoySr).
father(johnBoySr, johnBoyJr).

ancestor(X, Y) :- father(X, Y).
ancestor(X, Y) :- father(X, Z), ancestor(Z, Y).
