defmodule TimeManager.Management.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    many_to_many :users, TimeManager.Management.User, join_through: "users_teams"

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
  end
end
