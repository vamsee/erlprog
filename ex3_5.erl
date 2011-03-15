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
    io:format("f0~n"),
    L;
flatten_acc([H|[]],L) ->
    io:format("f1 - H: ~p L:~p~n", [H, L]),
    flatten_acc(H,L);
flatten_acc([[]|T],L) ->
    io:format("f2 - T: ~p L:~p~n", [T, L]),
    flatten_acc(T,L);
flatten_acc([H|T], L) ->
    io:format("f3 - H: ~p T: ~p L: ~p~n", [H,T,L]),
    flatten_acc(T, [H|L]);
flatten_acc(N,L) ->
    io:format("fN: ~p L~p~n", [N, L]),
    flatten_acc(L, [N|L]).

%% flatten_acc([[H|T]|T1],A) ->
%%     io:format("f1 - H: ~p T: ~p T1: ~p A:~p~n", [H, T, T1, A]),
%%     [flatten_acc(H,A)|[flatten_acc(T,A)|flatten_acc(T1,A)]];
%% flatten_acc([H|[]],A) ->
%%     io:format("f2 - H: ~p A:~p~n", [H, A]),
%%     flatten_acc(H,A);
%% flatten_acc([],A) ->
%%     io:format("f0~p~n", [A]),
%%     A;
%% flatten_acc([[]],A) ->
%%     io:format("f00~p~n", [A]),
%%     A;
%% flatten_acc(N,A) ->
%%     io:format("fN: ~p A~p~n", [N, A]),
%%     [N|A].



