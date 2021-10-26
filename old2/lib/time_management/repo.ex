defmodule TimeManagement.Repo do
  use Ecto.Repo,
    otp_app: :time_management,
    adapter: Ecto.Adapters.Postgres
end
