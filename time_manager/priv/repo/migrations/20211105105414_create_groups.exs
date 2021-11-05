defmodule TimeManager.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :manager_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:groups, [:manager_id])
  end
end
