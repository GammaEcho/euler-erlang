-module(factors).
-export([factorize/1]).
-include_lib("eunit/include/eunit.hrl").

% PROBLEM 3 - http://projecteuler.net/problem=3
% The prime factors of 13195 are 5, 7, 13 and 29.
% What is the largest prime factor of the number 600851475143 ?

factorize(N) when N == 0 -> [];
factorize(N) when N == 1 -> [];
factorize(N) when N > 1 ->
    factorize(N, 2, []).

factorize(1, _Factor, Factors) -> lists:reverse(Factors);
factorize(N, Factor, Factors) ->
    case is_factor(N, Factor) of
        true -> factorize(round(N / Factor), Factor, [Factor|Factors]);
        false -> factorize(N, Factor + 1, Factors)
    end.

is_factor(N, Factor) -> N rem Factor == 0.

factorize_test_() ->
    [?_assert(factorize(0) == []),
     ?_assert(factorize(1) == []),
     ?_assert(factorize(2) == [2]),
     ?_assert(factorize(3) == [3]),
     ?_assert(factorize(4) == [2,2]),
     ?_assert(factorize(5) == [5]),
     ?_assert(factorize(6) == [2,3]),
     ?_assert(factorize(17) == [17]),
     ?_assert(factorize(20) == [2,2,5]),
     ?_assert(factorize(26) == [2,13]),
     ?_assert(factorize(48) == [2,2,2,2,3]),
     ?_assert(factorize(147) == [3,7,7]),
     ?_assert(factorize(13195) == [5,7,13,29])].
