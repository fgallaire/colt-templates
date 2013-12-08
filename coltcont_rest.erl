%% @doc {{contid}} REST controller.
-module({{contid}}_rest_controller).

-export([init/3]).
-export([content_types_provided/2]).
-export([{{contid}}_to_html/2]).
-export([{{contid}}_to_json/2]).
-export([{{contid}}_to_text/2]).

init(_Transport, _Req, []) ->
	{upgrade, protocol, cowboy_rest}.

content_types_provided(Req, State) ->
	{[
		{<<"text/html">>, {{contid}}_to_html},
		{<<"application/json">>, {{contid}}_to_json},
		{<<"text/plain">>, {{contid}}_to_text}
	], Req, State}.

{{contid}}_to_html(Req, State) ->
	{ok, Body} = {{contid}}_template:render([{title, "Your Colt is shooting !"}, {text, "Your Colt is shooting REST as HTML !"}]),
	{Body, Req, State}.

{{contid}}_to_json(Req, State) ->
	Body = <<"{\"rest\": \"Your Colt is shooting REST as JSON !\"}">>,
	{Body, Req, State}.

{{contid}}_to_text(Req, State) ->
	{<<"Your Colt is shooting REST as text!">>, Req, State}.
