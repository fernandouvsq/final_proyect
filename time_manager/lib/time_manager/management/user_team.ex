defmodule TimeManager.Management.UserTeam do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_team" do

    timestamps()
  end

  @doc false
  def changeset(user_team, attrs) do
    user_team
    |> cast(attrs, [])
    |> validate_required([])
  end
end
