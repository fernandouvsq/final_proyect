defmodule TimeManager.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table (:teams) do

      timestamps()
    end

    create table(:users) do
      add :username, :string, null: false
      add :email, :string, null: false
      add :password, :string
      add :role, :integer, default: 0, null: false
      add :team_id, references(:teams)

      timestamps()
    end
  end
end
