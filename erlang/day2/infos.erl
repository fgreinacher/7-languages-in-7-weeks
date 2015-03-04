-module(infos).
-export([find/2]).

find(Keyword, Data) -> 
    lists:nth(
        1, 
        lists:filtermap(
            fun({K, V}) -> 
                case K of 
                    Keyword -> {true, V}; 
                    _ -> false 
                end 
            end, 
            Data
        )
    ).
