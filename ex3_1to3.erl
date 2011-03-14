-module(ex3_1to3).
-export([sum/1, sum/2, create/1, create_reverse/1, upto/1, even_upto/1]).

sum(1) ->
    1;
sum(N) ->
    N + sum(N-1).

sum(N, N) ->
    N;
sum(N, M) when N < M ->
    N + sum(N+1, M).

create_reverse(1) ->
    [1];
create_reverse(N) ->
    [N|create_reverse(N-1)].

create(N) ->
    create_acc(N, []).

create_acc(1, L) ->
    [1|L];
create_acc(N, L) ->
    create_acc(N-1, [N|L]).

upto(N) ->
    upto_acc(1, N).

upto_acc(_, 0) ->
    ok;
upto_acc(M, N) ->
    io:format("Number:~p~n", [M]),
    upto_acc(M+1, N-1).

even_upto(N) ->
    even_upto_acc(1, N).
even_upto_acc(_, 0) ->
    ok;
even_upto_acc(M, N) when M rem 2 == 0 ->
    io:format("Number:~p~n", [M]),
    even_upto_acc(M+1, N-1);
even_upto_acc(M, N) ->
    even_upto_acc(M+1, N-1).
