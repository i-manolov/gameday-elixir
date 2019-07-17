defmodule Gameday.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:email, :string)
      add(:provider, :string)

      timestamps()
    end

    create(unique_index(:users, [:email, :provider]))
  end
end
