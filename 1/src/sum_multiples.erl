-module(sum_multiples).
-export([sum/2, solution/0]).

sum(Divisors, Under) ->
  Multiples = find_multiples(Divisors, Under - 1, []),
  lists:sum(Multiples).

find_multiples(_Divisors, 0, Multiples) ->
  Multiples;

find_multiples(Divisors, CurrentNumber, Multiples) ->
  case is_multiple_of(Divisors, CurrentNumber) of
    true  ->
      find_multiples(Divisors, CurrentNumber - 1, [CurrentNumber | Multiples]);
    false ->
      find_multiples(Divisors, CurrentNumber - 1, Multiples)
  end.

is_multiple_of(Divisors, Number) ->
  lists:any(fun(X) -> (Number rem X) =:= 0 end, Divisors).

solution() ->
  io:format(
    "~nThe sum of all the multiples of 3 or 5 below 1000: ~p~n",
    [sum([3,5], 1000)]
  ).
