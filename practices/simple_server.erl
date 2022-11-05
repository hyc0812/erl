% Simple_Server_Version_1.1

-module(simple_server).
-export([start/0, message/2]).

start() -> spawn(fun loop/0).

message(Pid, What) ->
    rpc(Pid, What).

rpc(Pid, Request) ->
    Pid ! {self(), Request},
    receive
        {Pid, Response} ->
            Response
    after 100000 ->
        true
    end.

loop() ->
    receive
        {From, {yong, Message}} ->
            From ! {self(), Message},
            loop
    end.

% simpleServer -- version_1.0
% -module(test_server).
% -export([loop/0, rpc/2]).

% rpc(Pid, Request) ->
%     Pid ! {self(), Request},
%     receive
%         {Pid, Response} ->
%             Response
%     end.

% loop() ->
%     receive
%         {From, {yong, Message}} ->
%             From ! {self(), Message},
%             loop()
%     end.
