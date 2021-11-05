defmodule TimeManager.Management.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    belongs_to :user, TimeManager.Management.User

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:manager_id])
    |> validate_required([:manager_id])
  end
end
