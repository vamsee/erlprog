-module(db).
-export([new/0, write/3, read/2, match/2, delete/2]).

new() ->
    [].

write(Key, Element, Db) ->
    [{Key, Element}|Db].

find(Key, [{Key,Value}|_]) ->
    Value;
find(Key, [_|T]) ->
    find(Key, T).
    
read(Key, Db) ->
    try (find(Key,Db)) of
        Val ->
            {ok, Val}
    catch
        error:_ ->
            {error,instance}
    end.

match(Element, [{Key, Element}|T]) ->
    [Key | match(Element, T)];
match(_, [_|T]) ->
    T.

delete(_, [])  ->  []; 
delete(Key, [{Key, _} | Db])  ->  Db; 
delete(Key, [H|T])  ->  [H | delete(Key, T)].         

