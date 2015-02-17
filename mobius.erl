%%%-------------------------------------------------------------------
%%% @author SmirnovNick
%%% @copyright (C) 2015, BMSTU
%%% @doc
%%%
%%% @end
%%% Created : 10. фев 2015 16:32
%%%-------------------------------------------------------------------
-module(mobius).
-author("SmirnovNick").

%% API
-export([is_prime/1, prime_factors/1,is_square_multiple/1,find_square_multiples/2,timer/2]).

%------------ is_prime -------------
is_prime(I) -> is_prime(I,2).
is_prime(I,N) ->
  M = math:sqrt(I),
  if
    N =< M ->
      if
        I rem N == 0 -> false;
        I rem N /= 0 -> is_prime(I,N+1)
      end;
    true -> true
  end.
%--------- prime_factors -----------
prime_factors(N) -> prime_factors(2,N,[]).
prime_factors(N, Q, F)->
  M = is_prime(N),
  if
    N =< Q ->
      if
        M == true ->
          if
            Q rem N == 0 ->  prime_factors(N,Q div N,F ++ [N]);
            true -> prime_factors(N+1,Q,F)
          end;
        true -> prime_factors(N+1,Q,F)
      end;
    true -> io:format("~w~n",[F])
  end.
%------- is_square_multiple --------
is_square_multiple(N) -> is_square_multiple(N,N).
is_square_multiple(N, Q)->
  M = is_prime(N),
  S = N*N,
  if
    N >= 2 ->
      if
        M == true ->
          if
            Q rem S == 0 -> true;
            true -> is_square_multiple(N-1,Q)
          end;
        true -> is_square_multiple(N-1,Q)
      end;
    true -> false
  end.
%------ find_square_multiples ------
find_square_multiples(Count, MaxN) -> find_square_multiples(Count, MaxN, []).
find_square_multiples(Count, MaxN, Freq) when erlang:length(Freq) == Count ->
  MaxN + 1;
find_square_multiples(_, 2, _) -> false;
find_square_multiples(Count, MaxN, Freq) ->
  S = is_square_multiple(MaxN),
  if
    S == true -> Search = Freq ++ [MaxN];
    true -> Search = []
  end,
  find_square_multiples(Count, MaxN-1, Search).
%----------- timer -----------------
timer(N,Q) ->
  timer:tc(mobius,find_square_multiples, [N,Q]).

