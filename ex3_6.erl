-module(ex3_6).
-export([sort/1]).

sort([H|[H1|T]]) when H < H1 ->
    [H|sort([H1|T])];
sort([H|[H1|T]]) ->
    sort([H1|[H|T]]);
sort(N) ->
    N.


    
