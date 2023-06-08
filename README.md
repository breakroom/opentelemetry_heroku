# OpentelemetryHeroku

Exposes Heroku environment variables as an `OpenTelemetry` resource, using the
semantic conventions defined in the `OpenTelemetry`
[spec](https://opentelemetry.io/docs/specs/otel/resource/semantic_conventions/cloud_provider/heroku/).

## Installation

```elixir
def deps do
  [
    {:opentelemetry_heroku, "~> 0.1.0"}
  ]
end
```

## Usage

Include the module as one of the `resource_detectors` in the `OpenTelemetry` config:

```elixir
config :opentelemetry, resource_detectors: [OpentelemetryHeroku]
```
