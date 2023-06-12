rebar3 compile
rebar3 as docs edoc
version=0.2.0
ex_doc "opentelemetry_heroku" $version "_build/default/lib/opentelemetry_heroku/ebin" \
       --source-ref ${version} \
       --config docs.config $@