# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
alias Gameday.{Repo, Teams.Team}

if Repo.get(Team, "nym") == nil do
  Repo.insert!(%Team{id: "nym", name: "mets", location: "new york"})
end

if Repo.get(Team, "nyy") == nil do
  Repo.insert!(%Team{id: "nyy", name: "yankees", location: "new york"})
end
