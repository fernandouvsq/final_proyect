defmodule TimeManager.Management.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :username, :string
    field :password, :string
    field :role, Ecto.Enum, values: [Employee: 0, Manager: 1, General_Manager: 2]
    has_one :team, TimeManager.Management.Team

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :role])
    |> validate_required([:username, :email])
    |> validate_format(:email, ~r/@/)
  end
end
