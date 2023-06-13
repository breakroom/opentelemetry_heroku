-module(opentelemetry_heroku).

-behaviour(otel_resource_detector).
-export([get_resource/1]).

-include_lib("opentelemetry_semantic_conventions/include/resource.hrl").

get_resource(_) ->
    Attributes = [
        {?CLOUD_PROVIDER, <<"heroku">>},
        {?SERVICE_NAME, get_env("HEROKU_APP_NAME")},
        {?SERVICE_INSTANCE_ID, get_env("HEROKU_DYNO_ID")},
        {?SERVICE_VERSION, get_env("HEROKU_RELEASE_VERSION")},
        {'heroku.app.id', get_env("HEROKU_APP_ID")},
        {'heroku.release.creation_timestamp', get_env("HEROKU_RELEASE_CREATED_AT")},
        {'heroku.release.commit', get_env("HEROKU_SLUG_COMMIT")}
    ],

    % Don't return environment variables that don't exist
    CleanAttributes = lists:filter(fun({_Key, Value}) -> is_binary(Value) end, Attributes),

    otel_resource:create(CleanAttributes).

get_env(Var) ->
    case os:getenv(Var) of
        false -> false;
        Val -> unicode:characters_to_binary(Val)
    end.
