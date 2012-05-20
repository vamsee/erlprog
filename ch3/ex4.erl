-module(ex4).
-export([new/0, destroy/1, write/3, 
         read/2, match/2, delete/2]).

new() ->
    [].

destroy(_) ->
    %% do nothing, according to problem statement: 
    ok.

write(Key, El, Db) ->
    [{ Key, El } | Db].
    
read(Key, [H|T]) ->
    {_, Val} = H,
    case H == {Key, Val} of
        true -> {ok, Val};
        false -> read(Key, T)
    end;
read(_, []) ->
    {error, instance}.
    

match(Val, Db) ->    
    match_acc(Val, Db, []).

match_acc(Val, [H|T], Matches) ->
    {Key, _} = H,
    case H == {Key, Val} of
        true ->
            match_acc(Val, T, [Key|Matches]);
        false ->
            match_acc(Val, T, Matches)
    end;
match_acc(_, [], Matches) ->
    Matches.

delete(Key, [H|T]) ->
    {_, Val} = H,
    case H == {Key, Val} of 
        true ->
            T;
        false ->
            [H|T]
    end.
    

    
