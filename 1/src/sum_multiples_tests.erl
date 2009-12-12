-module(sum_multiples_tests).
-import(sum_multiples).

-include_lib("eunit/include/eunit.hrl").

upto_ten_test_() ->
  [
    ?_assertEqual(0,  sum_multiples:sum([3,5], 1)),
    ?_assertEqual(0,  sum_multiples:sum([3,5], 2)),
    ?_assertEqual(0,  sum_multiples:sum([3,5], 3)),
    ?_assertEqual(3,  sum_multiples:sum([3,5], 4)),
    ?_assertEqual(3,  sum_multiples:sum([3,5], 5)),
    ?_assertEqual(8,  sum_multiples:sum([3,5], 6)),
    ?_assertEqual(14, sum_multiples:sum([3,5], 7)),
    ?_assertEqual(14, sum_multiples:sum([3,5], 8)),
    ?_assertEqual(14, sum_multiples:sum([3,5], 9)),
    ?_assertEqual(23, sum_multiples:sum([3,5], 10))
  ].
