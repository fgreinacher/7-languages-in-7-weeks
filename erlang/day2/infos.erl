-module(infos).
-export([find/2]).

find(Keyword, Data) -> 
    lists:nth(
        1,
        lists:map(
            fun({_,V}) -> V end, 
            lists:filter(
                fun({K,_}) -> K == Keyword end, 
                Data
            )
        )
    ).
