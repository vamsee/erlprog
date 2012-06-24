-module(ex6).
-import(ex5, [concatenate/1]).
-export([quicksort/1, split_list/1, merge_sort/1, merge/3]).

quicksort([]) ->
    [];
quicksort([H|T]) ->
    quicksort_acc(H, T, [], []).

quicksort_acc(Pivot, [], Left, Right) ->
    concatenate([quicksort(Left), [Pivot], quicksort(Right)]);
quicksort_acc(Pivot, [H|T], Left, Right) when (H =< Pivot) ->
    quicksort_acc(Pivot, T, [H|Left], Right);
quicksort_acc(Pivot, [H|T], Left, Right) when (H > Pivot) ->
    quicksort_acc(Pivot, T, Left, [H|Right]).

list_len([]) ->
    0;
list_len([_|T]) ->
    1 + list_len(T).

split_list(L) ->
    Mid = list_len(L)/2,
    split_list_acc(L, Mid, 0, [], []).

split_list_acc([], _, _, Lft, Rgt) ->
    [Lft, Rgt];
split_list_acc([H|T], Mid, Idx, Lft, Rgt) when Idx < Mid ->
    split_list_acc(T, Mid, Idx+1, [H|Lft], Rgt);
split_list_acc([H|T], Mid, Idx, Lft, Rgt) when Idx >= Mid ->
    split_list_acc(T, Mid, Idx+1, Lft, [H|Rgt]).

merge_sort(L) ->
    [L1, L2] = split_list(L),
    merge(L1, L2, []).

merge([H1|[]], [H2|[]], _) ->
    io:format("hit ~n"),
    case H1 < H2 of 
        true -> [H1, H2];
        false -> [H2, H1]
    end;
merge(L1, L2, L) ->
    io:format("L1: ~w~n", [L1]),
    io:format("L2: ~w~n", [L2]),
    io:format("L: ~w~n", [L]),
    [L3, L4] = split_list(L1),
    [L5, L6] = split_list(L2),
    concatenate([merge(L3, L4, L), merge(L5, L6, L)]).
