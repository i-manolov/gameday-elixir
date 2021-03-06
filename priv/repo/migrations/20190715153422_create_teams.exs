defmodule Gameday.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams, primary_key: false) do
      add(:id, :string, primary_key: true)
      add(:name, :string, null: false)
      add(:location, :string, null: false)

      timestamps()
    end

    create(unique_index(:teams, [:name]))
  end
end
