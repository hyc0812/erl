-module(ctemplate).
-export([start/0, message/3]).

start() ->
    spawn(fun loop/0).

message(Name, Pid, What) ->
    register(Name, Pid),
    rpc(Name, What).

rpc(Pid, Request) ->
    Pid ! {self(), Request},
    receive
        {Pid, Response} ->
            Response
    end.

loop() ->
    receive
        Any ->
            io:format("Received:~p~n", [Any]),
            loop()
    end.
