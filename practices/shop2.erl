-module(shop2).
-export([total/1, total2/1]).
-import(lists, [map/2, sum/1]).
-import(shop, [cost/1]).

total(L)  -> sum(map(fun({What, N}) -> cost(What) * N end, L)).
total2(L) -> sum([cost(What) * N || {What, N} <- L]).