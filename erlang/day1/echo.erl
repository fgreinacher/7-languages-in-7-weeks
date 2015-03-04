-module(echo).
-export([ping/1]).

ping(success) -> io:fwrite("success~n");
ping({error,Message}) -> io:fwrite("error: ~s~n", [Message]).
