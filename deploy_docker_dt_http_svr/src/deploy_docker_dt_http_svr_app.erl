%%%-------------------------------------------------------------------
%% @doc deploy_docker_dt_http_svr public API
%% @end
%%%-------------------------------------------------------------------

-module(deploy_docker_dt_http_svr_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    deploy_docker_dt_http_svr_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
