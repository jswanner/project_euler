-module(primes_tests).
-import(primes).

-include_lib("eunit/include/eunit.hrl").

is_prime_till_ten_test_() ->
  [
    ?_assertEqual(false,  primes:is_prime(1)),
    ?_assertEqual(true,   primes:is_prime(2)),
    ?_assertEqual(true,   primes:is_prime(3)),
    ?_assertEqual(false,  primes:is_prime(4)),
    ?_assertEqual(true,   primes:is_prime(5)),
    ?_assertEqual(false,  primes:is_prime(6)),
    ?_assertEqual(true,   primes:is_prime(7)),
    ?_assertEqual(false,  primes:is_prime(8)),
    ?_assertEqual(false,  primes:is_prime(9)),
    ?_assertEqual(false,  primes:is_prime(10))
  ].
