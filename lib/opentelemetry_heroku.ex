defmodule OpentelemetryHeroku do
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
