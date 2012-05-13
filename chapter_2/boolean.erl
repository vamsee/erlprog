-module(boolean).
-export([b_not/1, b_and/2, b_nand/2]).

b_not(false) ->
    true;
b_not(true) ->
    false.

b_and(false, true) ->
    false;
b_and(true, false) ->
    false;
b_and(false, false) ->
    false;
b_and(true, true) ->
    true.

b_nand(X, Y) ->
    b_not(b_and(X, Y)).


