-module(fib).
-export([seq/1, even/1, sum_even/1, solution/0]).

seq(0) ->
  [0];

seq(Upto) ->
  lists:reverse(seq(Upto, [1,0])).

seq(Upto, [L | [R | Rest]]) ->
  Curr = L + R,
  case Curr =< Upto of
    true  -> seq(Upto, [Curr | [L | [R | Rest]]]);
    false -> [L | [R | Rest]]
  end.

even(Upto) ->
  lists:filter(fun(X) -> is_even(X) end, seq(Upto)).

is_even(Num) ->
  (Num rem 2) =:= 0.

sum_even(Upto) ->
  lists:sum(even(Upto)).

solution() ->
  io:format(
    "~nSum of even fibonacci sequence numbers "
    "less than 4,000,000: ~p ~n", [sum_even(4000000)]
  ).
