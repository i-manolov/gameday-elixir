defmodule Gameday.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, []}
  schema "teams" do
    field :name, :string
    field :location, :string

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:id, :name, :location])
    |> validate_required([:id, :name, :location])
    |> unique_constraint(:name)
  end
end
