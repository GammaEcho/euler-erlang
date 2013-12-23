-module(fibonacci).
-export([sum_even/1]).
-include_lib("eunit/include/eunit.hrl").

% PROBLEM 2 - http://projecteuler.net/problem=2
% Each new term in the Fibonacci sequence is generated by adding
% the previous two terms. By starting with 1 and 2, the first
% 10 terms will be: 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

% By considering the terms in the Fibonacci sequence whose
% valuesdo not exceed four million, find the sum of the
% even-valued terms.

sum_even(UpperBound) ->
    sum_even(UpperBound, 1, 1, 0).

sum_even(UpperBound, _, N2, Sum) when N2 > UpperBound -> Sum;
sum_even(UpperBound, N1, N2, Sum) ->
    case is_even(N2) of
        true -> sum_even(UpperBound, N2, N1 + N2, Sum + N2);
        false -> sum_even(UpperBound, N2, N1 + N2, Sum)
    end.

is_even(N) -> N rem 2 == 0.

sum_even_test_() ->
    [?_assert(sum_even(1) == 0),
     ?_assert(sum_even(2) == 2),
     ?_assert(sum_even(3) == 2),
     ?_assert(sum_even(5) == 2),
     ?_assert(sum_even(8) == 10),
     ?_assert(sum_even(13) == 10),
     ?_assert(sum_even(34) == 44)].
