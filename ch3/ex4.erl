-module(ex4).
-export([new/0, destroy/1, write/3, read/2]).

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

        

