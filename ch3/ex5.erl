-module(ex5).
-export([filter/2, reverse/1,
        help/2, concatenate/1]).

filter([], _) ->
    [];
filter([H|T], E) when H =< E ->
    [H|filter(T, E)];
filter([_|T], E) ->
    filter(T, E).

reverse(L) ->
    reverse_acc(L, []).

reverse_acc([H|T], L) ->
    reverse_acc(T, [H|L]);
reverse_acc([], L) ->
    L.

concatenate([]) ->
    [];
concatenate([H|T]) ->
    help(H, concatenate(T)).

help([H|T], L) ->
    [H|help(T,L)];
help([], L) ->
    L.

    


    

    
