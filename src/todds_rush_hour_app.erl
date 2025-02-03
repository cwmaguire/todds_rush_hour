%%%-------------------------------------------------------------------
%% @doc todds_rush_hour public API
%% @end
%%%-------------------------------------------------------------------

-module(todds_rush_hour_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    todds_rush_hour_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
