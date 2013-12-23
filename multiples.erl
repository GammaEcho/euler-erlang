-module(multiples).
-export([three_or_five/1]).
-include_lib("eunit/include/eunit.hrl").

% PROBLEM 1 - http://projecteuler.net/problem=1
% If we list all the natural numbers below 10 that are multiples
% of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
% Find the sum of all the multiples of 3 or 5 below 1000.

three_or_five(N) -> three_or_five(N - 1, 0).

three_or_five(N, Sum) when N < 0 -> Sum;
three_or_five(0, Sum) -> Sum;

three_or_five(N, Sum) when N > 0 ->
    case is_multiple_of_three_or_five(N) of
        true -> three_or_five(N - 1, Sum + N);
        false -> three_or_five(N - 1, Sum)
    end.

is_multiple_of_three_or_five(N) ->
    is_multiple_of_three(N) or is_multiple_of_five(N).
is_multiple_of_three(N) -> N rem 3 == 0.
is_multiple_of_five(N) -> N rem 5 == 0.

three_or_five_n1_test() -> ?assert(three_or_five(0) == 0).
three_or_five_0_test() -> ?assert(three_or_five(1) == 0).
three_or_five_3_test() -> ?assert(three_or_five(4) == 3).
three_or_five_5_test() -> ?assert(three_or_five(6) == 8).
three_or_five_6_test() -> ?assert(three_or_five(7) == 14).
three_or_five_10_test() -> ?assert(three_or_five(10) == 23).
