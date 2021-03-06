%% @private
-module({{appid}}_app).
-behaviour(application).

%% API.
-export([start/2]).
-export([stop/1]).

%% API.

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
		{'_', [
			{"/", cowboy_static, {priv_file, {{appid}}, "index.html"}},
			{"/websocket", {{contid}}_{{conttype}}_controller, []},
			{"/static/[...]", cowboy_static, {priv_dir, {{appid}}, "static"}}
		]}
	]),
	{ok, _} = cowboy:start_http(http, 100, [{port, 8080}], [
		{env, [{dispatch, Dispatch}]}
	]),
	{{appid}}_sup:start_link().

stop(_State) ->
	ok.
