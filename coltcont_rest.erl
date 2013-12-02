%% @doc {{contid}} REST controller.
-module({{contid}}_rest_controller).

-export([init/3]).
-export([content_types_provided/2]).
-export([hello_to_html/2]).
-export([hello_to_json/2]).
-export([hello_to_text/2]).

init(_Transport, _Req, []) ->
	{upgrade, protocol, cowboy_rest}.

content_types_provided(Req, State) ->
	{[
		{<<"text/html">>, hello_to_html},
		{<<"application/json">>, hello_to_json},
		{<<"text/plain">>, hello_to_text}
	], Req, State}.

hello_to_html(Req, State) ->
	Body = <<"<html>
<head>
	<meta charset=\"utf-8\">
	<title>Your Colt is shooting !</title>
</head>
<body>
	<p>Your Colt is shooting REST as HTML !</p>
</body>
</html>">>,
	{Body, Req, State}.

hello_to_json(Req, State) ->
	Body = <<"{\"rest\": \"Your Colt is shooting REST as JSON !\"}">>,
	{Body, Req, State}.

hello_to_text(Req, State) ->
	{<<"Your Colt is shooting REST as text!">>, Req, State}.
