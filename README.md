# OpentelemetryHeroku

Exposes Heroku environment variables as an `OpenTelemetry` resource, using the
semantic conventions defined in the `OpenTelemetry`
[spec](https://opentelemetry.io/docs/specs/otel/resource/semantic_conventions/cloud_provider/heroku/).

## Installation

### Elixir

```elixir
def deps do
  [
    {:opentelemetry_heroku, "~> 0.2"}
  ]
end
```

### Erlang

```erlang
{deps, [
  {opentelemetry_heroku, "~> 0.2"}
]}.
```

## Usage

Include the module as one of the `resource_detectors` in the `OpenTelemetry` config:

### Elixir

```elixir
config :opentelemetry, resource_detectors: [:opentelemetry_heroku]
```

### Erlang

```erlang
%% config/sys.config.src
{resource_detectors, [opentelemetry_heroku]}
```
