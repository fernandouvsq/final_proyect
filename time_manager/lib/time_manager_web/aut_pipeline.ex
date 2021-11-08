defmodule TimeManagerWeb.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :time_manager,
  module: TimeManagerWeb.Guardian,
  error_handler: TimeManagerWeb.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
