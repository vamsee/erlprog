-module(ex3_7).
-export([new/0, write/3, read/2, match/2, delete/2]).

new() ->
    [].

write(Key, Element, Db) ->
    [{Key, Element}|Db].

read(Key, Db) ->
    case (lists:keyfind(Key, 1, Db)) of
        {_, Val} ->
            {ok, Val};
        false ->
            {error, instance}
    end.

match(Element, [{Key, Element}|T]) ->
    [Key | match(Element, T)];
match(_, [_|T]) ->
    T.

delete(Key, Db) ->
    lists:keydelete(Key, 1, Db).
