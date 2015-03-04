-module(count).
-export([to_ten/0]).
-export([to_one_million/0]).

to_ten() -> count(1, 10).
to_one_million() -> count(1, 1000000).
count(_, 0) -> ok;
count(Current, Remaining) -> io:fwrite("~B~n", [Current]), count(Current + 1, Remaining - 1).

