defmodule TimeManagerWeb.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :time_manager,
  module: TimeManagerWeb.Guardian,
  error_handler: TimeManagerWeb.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, scheme: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
