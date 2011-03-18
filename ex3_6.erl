-module(ex3_6).
-export([sort/1]).

sort_max([H|[H1|T]]) when H =< H1 ->
    [H|sort_max([H1|T])];
sort_max([H|[H1|T]]) ->
    sort_max([H1|[H|T]]);
sort_max(N) ->
    N.

sort_rev(L) ->
    reverse(sort_max(L), []).

reverse([], L) ->
    L;
reverse([H|T], L) ->
    reverse(T, [H|L]).

sort(L) ->
    sort_acc(sort_rev(L), []).

sort_acc([], L) ->
    L;
sort_acc([H|T], L) ->
    sort_acc(sort_rev(T), [H|L]).
    
    
