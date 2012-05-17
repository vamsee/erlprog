-module(ex3).
-export([print_int/1]).

print_int(N) ->
    int_acc(1, N).

int_acc(N, N) ->
    io:format("Number: ~p~n",[N]);
int_acc(M, N) ->
    io:format("Number: ~p~n",[M]),
    int_acc(M+1, N).
