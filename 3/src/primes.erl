-module(primes).
-export([is_prime/1, seq/1]).

%% is_prime/1
is_prime(1)   -> false;
is_prime(Num) ->
  is_prime(Num, lists:seq(2, Num - 1)).

%% is_prime/2
is_prime(_, [])     -> true;
is_prime(Num, [H | T]) ->
  case (Num rem H) =:= 0 of
    true  -> false;
    false -> is_prime(Num, T)
  end.

%% seq/1
seq(Num) when Num < 2 ->
  [];
seq(Num) ->
  seq(Num, [], lists:seq(2,Num)).

seq(_, Primes, []) ->
  lists:reverse(Primes);
seq(Num, Primes, [H | T]) ->
  NewSeq = T -- lists:seq(H * 2, Num, H),
  case is_prime(H) of
    true  -> seq(Num, [H | Primes], NewSeq);
    false -> seq(Num, Primes, NewSeq)
  end.
