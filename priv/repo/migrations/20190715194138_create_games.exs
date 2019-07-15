defmodule Gameday.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add(:scheduled_datetime, :utc_datetime, null: false)
      add(:home_team_id, references(:teams, type: :string, on_delete: :nothing), null: false)

      timestamps()
    end

    create(index(:games, [:home_team_id]))
    create(unique_index(:games, [:home_team_id, :scheduled_datetime]))
  end
end
