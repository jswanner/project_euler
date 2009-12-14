-module(prime_factors).
-export([seq/1, largest/1, solution/0]).
-import(primes).

seq(Num) ->
  seq(Num, [], primes:seq(Num)).

seq(_, PrimeFactors, [])     ->
  PrimeFactors;
seq(Num, PrimeFactors, [H | T]) ->
  case (Num rem H) =:= 0 of
    true  -> seq(Num, [H | PrimeFactors], T);
    false -> seq(Num, PrimeFactors, T)
  end.

largest(Num) ->
  [H | _] = seq(Num),
  H.

solution() ->
  io:format(
    "~nLargest prime factor of the number 600851475143: ~p~n",
    [largest(475143)]
  ).
