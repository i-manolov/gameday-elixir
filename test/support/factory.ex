defmodule Gameday.Factory do
  use ExMachina.Ecto, repo: Gameday.Repo

  alias Gameday.Teams.Team
  alias Gameday.Schedule.Game

  def team_factory do
    %Team{
      id: sequence("team_id"),
      name: "name",
      location: "location"
    }
  end

  def game_factory do
    %Game{
      scheduled_datetime: DateTime.utc_now(),
      home_team_id: build(:team)
    }
  end
end
