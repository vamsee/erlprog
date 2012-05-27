-module(ex5).
-export([filter/2, reverse/1,
         concatenate/1, flatten/1]).

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

flatten(L) ->
    flatten_acc(L, []).

flatten_acc([H|T], L) ->
    concatenate([flatten_acc(H, L),flatten_acc(T, L)]);
flatten_acc([], L) ->
    L;
flatten_acc(N, L) ->
    [N|L].


