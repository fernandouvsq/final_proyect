defmodule TimeManager.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    alter table(:teams) do
      add :user_id, references(:users)
    end

    create index(:teams, [:user_id])
  end
end
