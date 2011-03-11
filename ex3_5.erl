-module(ex3_5).
-export([filter/2, reverse/1, 
         concatenate/1, flatten/1]).

filter([], _) ->
    [];
filter([H|T], E) when H =< E ->
    [H | filter(T, E)];
filter([_|T], E) ->
    filter(T,E).

reverse(L) ->
    reverse_acc(L, []).

reverse_acc([], L) ->
    L;
reverse_acc([H|T], L) ->
    reverse_acc(T, [H|L]).

concatenate([[]]) ->
    [];
concatenate([[]|T]) ->
    concatenate(T);
concatenate([[H|T]|T2]) ->
    [H|concatenate([T|T2])].

flatten([]) ->
    [];
flatten([H|[]]) ->
    flatten(H);
flatten([[]|T]) ->
    flatten(T);
flatten([[H|T]|T2]) ->
    [H|flatten(concatenate([T|T2]))];
flatten([H|T]) ->
    [H|flatten(T)].
