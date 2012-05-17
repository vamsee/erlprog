-module(ex2).
-export([create/1, create_reverse/1]).

create_reverse(1) ->
    [1];
create_reverse(N) ->
    [N|create_reverse(N-1)].


create(N) ->
    create_acc(N, []).

create_acc(1,L) ->
    [1|L];
create_acc(N, L) ->
    create_acc(N-1, [N|L]).
    
    
    

