-module(ex1).
-export([sum/1, sum/2]).

sum(1) ->
    1;
sum(N) ->
    N + sum(N-1).

sum(M, M) ->
    M;
sum(N, M) when M >= N ->
    N + sum(N+1, M);
sum(N, M) when N > M ->
    throw(badrange).


    
