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

flatten(L)->
    flatten_acc(L,[]).

flatten_acc([], L) ->
    io:format("f0: ~p~n", [L]),
    reverse(L);
flatten_acc([[[]]|T], L) ->
    io:format("f1: T: ~p L: ~p~n", [T, L]),
    flatten_acc(T,L);
flatten_acc([H|[]], L) ->
    io:format("f3 - T: ~p L: ~p~n", [H, L]),
    flatten_acc(H, L);
flatten_acc([[]|T], L) ->
    io:format("f2 - T: ~p L: ~p~n", [T, L]),
    flatten_acc(T, L);
flatten_acc([[[[H]]]|T], L) ->
    io:format("f4 - H: ~p T: ~p L: ~p~n", [H,T,L]),
    flatten_acc(T, [H|L]);
flatten_acc([[[H]|T]|T1], L) ->
    io:format("f5 - H: ~p T: ~p T1: ~p L: ~p~n", [H,T,T1,L]),
    flatten_acc([T|T1], [H|L]);
flatten_acc([[[H|T]]|T1], L) ->
    io:format("f6 - H: ~p T: ~p T1: ~p L: ~p~n", [H,T,T1,L]),
    flatten_acc([T|T1], [H|L]);
flatten_acc([[H|T]|T1], L) ->
    io:format("f7 - H: ~p T: ~p T1: ~p L: ~p~n", [H,T,T1,L]),
    flatten_acc([T|T1], [H|L]);
flatten_acc([H|T], L) ->
    io:format("f8 - H: ~p T: ~p L: ~p~n", [H,T,L]),
    flatten_acc(T, [H|L]);
flatten_acc(N, L) ->
    flatten_acc([], [N|L]).

