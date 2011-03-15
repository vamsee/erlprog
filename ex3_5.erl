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

flatten([H|[]]) ->
    io:format("f1 - H: ~p~n", [H]),
    flatten(H);
flatten([[]|T]) ->
    io:format("f2 - T: ~p~n", [T]),
    flatten(T);
flatten([[H|T]|T2]) ->
    io:format("f3 - H: ~p T: ~p T2: ~p~n", [H, T, T2]),
    %% concatenate([flatten([H|T]) | flatten(T2)]);
    [flatten(H)|flatten(concatenate([T,T2]))];
flatten(N) ->
    io:format("f5 - called once~n"),
    N.
