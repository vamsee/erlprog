-module(recursion).
-export([bump/1, sum/1, len/1, 
         average/1, even/1, member/2,
         sum_acc/2, bump_acc/2, reverse/1,
         average_acc/3]).

bump([]) ->
    [];
bump([Head | Tail]) ->
    [Head+1 | bump(Tail)].

sum([]) ->
    0;
sum([Head | Tail]) ->
    Head + sum(Tail).

len([]) ->
    0;
len([_Head | Tail]) ->
    1 + len(Tail).

average(List) ->
    sum(List) / len(List).

even([]) ->
    [];
even([Head | Tail]) when Head rem 2 == 0 ->
    [Head | even(Tail)];
even([_ | Tail]) -> even(Tail).

member(_, []) ->
    false;
member(H, [H|_]) ->
    true;
member(H, [_|T]) ->
    member(H, T).
    
sum_acc([], Sum) ->
    Sum;
sum_acc([Head|Tail], Sum) ->
    sum_acc(Tail, Head+Sum).

bump_acc([], Acc) ->
    Acc;
bump_acc([Head|Tail], Acc) ->
    bump_acc(Tail, [Head+1 | Acc]).


reverse(List) ->
    reverse_acc(List, []).

reverse_acc([], Acc) ->
    Acc;
reverse_acc([Head|Tail], Acc) ->
    reverse_acc(Tail, [Head | Acc]).

average_acc([], 0, 0) ->
    undefined;
average_acc([], Sum, Length) ->
    Sum / Length;
average_acc([H|T], Sum, Length) ->
    average_acc(T, Sum+H, Length +1).
