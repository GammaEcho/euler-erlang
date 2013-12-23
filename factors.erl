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
    [?_assertEqual([], factorize(0)),
     ?_assertEqual([], factorize(1)),
     ?_assertEqual([2], factorize(2)),
     ?_assertEqual([3], factorize(3)),
     ?_assertEqual([2,2], factorize(4)),
     ?_assertEqual([5], factorize(5)),
     ?_assertEqual([2,3], factorize(6)),
     ?_assertEqual([17], factorize(17)),
     ?_assertEqual([2,2,5], factorize(20)),
     ?_assertEqual([2,13], factorize(26)),
     ?_assertEqual([2,2,2,2,3], factorize(48)),
     ?_assertEqual([3,7,7], factorize(147)),
     ?_assertEqual([5,7,13,29], factorize(13195))].
