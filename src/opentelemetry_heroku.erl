-module(opentelemetry_heroku).

-behaviour(otel_resource_detector).
-export([get_resource/1]).

-include_lib("opentelemetry_semantic_conventions/include/resource.hrl").

get_resource(_) ->
    otel_resource:create([
        {?CLOUD_PROVIDER, "heroku"},
        {?SERVICE_NAME, get_env("HEROKU_APP_NAME")},
        {?SERVICE_INSTANCE_ID, get_env("HEROKU_DYNO_ID")},
        {?SERVICE_VERSION, get_env("HEROKU_RELEASE_VERSION")},
        {'heroku.app.id', get_env("HEROKU_APP_ID")},
        {'heroku.release.creation_timestamp', get_env("HEROKU_RELEASE_CREATED_AT")},
        {'heroku.release.commit', get_env("HEROKU_SLUG_COMMIT")}
    ]).

get_env(Var) ->
    case os:getenv(Var) of
        false -> <<"unknown">>;
        Val -> unicode:characters_to_binary(Val)
    end.
