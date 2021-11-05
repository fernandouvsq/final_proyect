defmodule TimeManager.Management.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    belongs_to :user, TimeManager.Management.User

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:manager_id])
    |> validate_required([:manager_id])
  end
end
