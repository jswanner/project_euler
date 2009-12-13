-module(fib_tests).
-import(fib).

-include_lib("eunit/include/eunit.hrl").

sequence_till_ten_test_() ->
  [
    ?_assertEqual([0],              fib:seq(0)),
    ?_assertEqual([0,1,1],          fib:seq(1)),
    ?_assertEqual([0,1,1,2],        fib:seq(2)),
    ?_assertEqual([0,1,1,2,3],      fib:seq(3)),
    ?_assertEqual([0,1,1,2,3],      fib:seq(4)),
    ?_assertEqual([0,1,1,2,3,5],    fib:seq(5)),
    ?_assertEqual([0,1,1,2,3,5],    fib:seq(6)),
    ?_assertEqual([0,1,1,2,3,5],    fib:seq(7)),
    ?_assertEqual([0,1,1,2,3,5,8],  fib:seq(8)),
    ?_assertEqual([0,1,1,2,3,5,8],  fib:seq(9)),
    ?_assertEqual([0,1,1,2,3,5,8],  fib:seq(10))
  ].

even_till_ten_test_() ->
  [
    ?_assertEqual([0],      fib:even(0)),
    ?_assertEqual([0],      fib:even(1)),
    ?_assertEqual([0,2],    fib:even(2)),
    ?_assertEqual([0,2],    fib:even(3)),
    ?_assertEqual([0,2],    fib:even(4)),
    ?_assertEqual([0,2],    fib:even(5)),
    ?_assertEqual([0,2],    fib:even(6)),
    ?_assertEqual([0,2],    fib:even(7)),
    ?_assertEqual([0,2,8],  fib:even(8)),
    ?_assertEqual([0,2,8],  fib:even(9)),
    ?_assertEqual([0,2,8],  fib:even(10))
  ].

sum_even_till_ten_test_() ->
  [
    ?_assertEqual(0,  fib:sum_even(0)),
    ?_assertEqual(0,  fib:sum_even(1)),
    ?_assertEqual(2,  fib:sum_even(2)),
    ?_assertEqual(2,  fib:sum_even(3)),
    ?_assertEqual(2,  fib:sum_even(4)),
    ?_assertEqual(2,  fib:sum_even(5)),
    ?_assertEqual(2,  fib:sum_even(6)),
    ?_assertEqual(2,  fib:sum_even(7)),
    ?_assertEqual(10, fib:sum_even(8)),
    ?_assertEqual(10, fib:sum_even(9)),
    ?_assertEqual(10, fib:sum_even(10))
  ].
