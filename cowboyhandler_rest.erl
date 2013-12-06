%% @doc {{handlerid}} REST handler.
-module({{handlerid}}_rest_handler).

-export([init/3]).
-export([content_types_provided/2]).
-export([{{handlerid}}_to_html/2]).
-export([{{handlerid}}_to_json/2]).
-export([{{handlerid}}_to_text/2]).

init(_Transport, _Req, []) ->
	{upgrade, protocol, cowboy_rest}.

content_types_provided(Req, State) ->
	{[
		{<<"text/html">>, {{handlerid}}_to_html},
		{<<"application/json">>, {{handlerid}}_to_json},
		{<<"text/plain">>, {{handlerid}}_to_text}
	], Req, State}.

{{handlerid}}_to_html(Req, State) ->
	Body = <<"<html>
<head>
	<meta charset=\"utf-8\">
	<title>Your Cowboy is shooting !</title>
</head>
<body>
	<p>Your Cowboy is shooting REST as HTML !</p>
</body>
</html>">>,
	{Body, Req, State}.

{{handlerid}}_to_json(Req, State) ->
	Body = <<"{\"rest\": \"Your Cowboy is shooting REST as JSON !\"}">>,
	{Body, Req, State}.

{{handlerid}}_to_text(Req, State) ->
	{<<"Your Cowboy is shooting REST as text!">>, Req, State}.
