-module(ex3_5).
-export([filter/2, reverse/1, 
         concatenate/1, flatten/1, is_list/1]).

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

is_list([_|_]) ->
    true;
is_list(_) ->
    false.

%% finally correct solution thanks to:
%% http://benjaminhalsted.com/2010/03/erlang-programming-exercise-3-5-refactor/#comments

flatten(L)->
    flatten_acc(L,[]).

flatten_acc([], L) ->
    reverse(L);
flatten_acc([H|T], L) when is_list(H) == true ->
    flatten_acc(concatenate([H,T]), L);
flatten_acc([H|T], L) ->
    flatten_acc(T, [H|L]).
