%%%-------------------------------------------------------------------
%%% @author SmirnovNick
%%% @copyright (C) 2015, BMSTU
%%% @doc
%%%
%%% @end
%%% Created : 10. фев 2015 11:45
%%%-------------------------------------------------------------------
-module(fib).
-author("SmirnovNick").

%% API
-export([fib_p/1,fib_g/1,tail_fib/1,timer/1]).
%------------ fib_p ----------------
fib_p(0) -> 0;
fib_p(1) -> 1;
fib_p(2) -> 1;
fib_p(N) -> fib_p(N-1) + fib_p(N-2).
%------------ fib_g ----------------
fib_g(N) when N == 0 -> 0;
fib_g(N) when N == 1 -> 1;
fib_g(N) when N == 2 -> 1;
fib_g(N) when N>2 -> fib_g(N-1) + fib_g(N-2).
%---------- tail_fib ---------------
tail_fib(N) -> tail_fib_helper(N, 0, []).
tail_fib_helper(1, _, _) -> 1;
tail_fib_helper(2, _, _) -> 1;
tail_fib_helper(E, 0, []) -> tail_fib_helper(E, 1, [1]);
tail_fib_helper(E, 1, [1]) -> tail_fib_helper(E, 2, [1, 1]);
tail_fib_helper(E, I, [X,Y|Tail]) when E =/= I -> tail_fib_helper(E, I+1, [X+Y, X, Y|Tail]);
tail_fib_helper(N, N, [Head| _]) -> Head.
%----------- timer -----------------
timer(N) ->
  timer:tc(fib, tail_fib, [N]).
