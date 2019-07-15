defmodule Gameday.Factory do
  use ExMachina.Ecto, repo: Gameday.Repo

  alias Gameday.Teams.Team

  def team_factory do
    %Team{
      id: sequence("team_id"),
      name: "name",
      location: "location"
    }
  end
end
