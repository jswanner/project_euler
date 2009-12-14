-module(prime_factors_tests).
-import(prime_factors).
-import(primes).

-include_lib("eunit/include/eunit.hrl").

% tests for module: prime_factors
largest_till_ten_test_() ->
  [
    ?_assertEqual(2, prime_factors:largest(2)),
    ?_assertEqual(3, prime_factors:largest(3)),
    ?_assertEqual(2, prime_factors:largest(4)),
    ?_assertEqual(5, prime_factors:largest(5)),
    ?_assertEqual(3, prime_factors:largest(6)),
    ?_assertEqual(7, prime_factors:largest(7)),
    ?_assertEqual(2, prime_factors:largest(8)),
    ?_assertEqual(3, prime_factors:largest(9)),
    ?_assertEqual(5, prime_factors:largest(10))
  ].

seq_till_ten_test_() ->
  [
    ?_assertEqual([],    prime_factors:seq(1)),
    ?_assertEqual([2],   prime_factors:seq(2)),
    ?_assertEqual([3],   prime_factors:seq(3)),
    ?_assertEqual([2],   prime_factors:seq(4)),
    ?_assertEqual([5],   prime_factors:seq(5)),
    ?_assertEqual([3,2], prime_factors:seq(6)),
    ?_assertEqual([7],   prime_factors:seq(7)),
    ?_assertEqual([2],   prime_factors:seq(8)),
    ?_assertEqual([3],   prime_factors:seq(9)),
    ?_assertEqual([5,2], prime_factors:seq(10))
  ].


%% tests for module: primes
prime_seq_test_() ->
  [
    ?_assertEqual([],               primes:seq(0)),
    ?_assertEqual([],               primes:seq(1)),
    ?_assertEqual([2],              primes:seq(2)),
    ?_assertEqual([2,3],            primes:seq(3)),
    ?_assertEqual([2,3],            primes:seq(4)),
    ?_assertEqual([2,3,5],          primes:seq(5)),
    ?_assertEqual([2,3,5],          primes:seq(6)),
    ?_assertEqual([2,3,5,7],        primes:seq(7)),
    ?_assertEqual([2,3,5,7],        primes:seq(8)),
    ?_assertEqual([2,3,5,7],        primes:seq(9)),
    ?_assertEqual([2,3,5,7],        primes:seq(10)),
    ?_assertEqual([2,3,5,7,11],     primes:seq(11)),
    ?_assertEqual([2,3,5,7,11,13],  primes:seq(13))
  ].

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

is_prime_larger_prime_numbers_test_() ->
  [
    ?_assertEqual(true,   primes:is_prime(31)),
    ?_assertEqual(true,   primes:is_prime(37)),
    ?_assertEqual(true,   primes:is_prime(97)),
    ?_assertEqual(true,   primes:is_prime(101))
  ].

is_prime_larger_non_prime_numbers_test_() ->
  [
    ?_assertEqual(false,  primes:is_prime(33)),
    ?_assertEqual(false,  primes:is_prime(39)),
    ?_assertEqual(false,  primes:is_prime(91))
  ].
