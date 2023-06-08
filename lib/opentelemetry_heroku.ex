defmodule OpentelemetryHeroku do
  @moduledoc """
  Implements an `OpenTelemetry` resource detector for Heroku.

  Exposes Heroku environment variables as an `OpenTelemetry` resource, using the
  semantic conventions defined in the `OpenTelemetry`
  [spec](https://opentelemetry.io/docs/specs/otel/resource/semantic_conventions/cloud_provider/heroku/).

  ## Usage:

  Add this module to the config:

  ```elixir
  config :opentelemetry, resource_detectors: [OpentelemetryHeroku]
  ```
  """
  require OpenTelemetry.SemanticConventions.Resource
  alias OpenTelemetry.SemanticConventions.Resource

  @behaviour :otel_resource_detector
  def get_resource(_) do
    [
      {Resource.cloud_provider(), "heroku"},
      {Resource.service_name(), System.get_env("HEROKU_APP_NAME")},
      {Resource.service_instance_id(), System.get_env("HEROKU_DYNO_ID")},
      {Resource.service_version(), System.get_env("HEROKU_RELEASE_VERSION")},
      {:"heroku.app.id", System.get_env("HEROKU_APP_ID")},
      {:"heroku.release.creation_timestamp", System.get_env("HEROKU_RELEASE_CREATED_AT")},
      {:"heroku.release.commit", System.get_env("HEROKU_SLUG_COMMIT")}
    ]
    |> :otel_resource.create()
  end
end
