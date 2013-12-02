%% @doc {{contid}} HTTP controller.
-module({{contid}}_http_controller).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

init(_Type, Req, []) ->
	{ok, Req, undefined}.

handle(Req, State) ->
	Headers = [{<<"content-type">>, <<"text/plain">>}],
	Content = <<"Your Colt is shooting HTTP as text !">>,
	{ok, Req2} = cowboy_req:reply(200, Headers, Content, Req),
	{ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
	ok.
