defmodule Gameday.Schedule.Game do
  use Ecto.Schema
  import Ecto.Changeset

  alias Gameday.Teams.Team

  schema "games" do
    field :scheduled_datetime, :utc_datetime
    belongs_to :team, Team, foreign_key: :home_team_id, type: :string

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:home_team_id, :scheduled_datetime])
    |> validate_required([:home_team_id, :scheduled_datetime])
    |> assoc_constraint(:team)
    |> unique_constraint(:scheduled_datetime, name: :games_home_team_id_scheduled_datetime_index)
  end
end
