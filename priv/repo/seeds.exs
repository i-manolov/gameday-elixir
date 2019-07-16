# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
alias Gameday.{Repo, Teams.Team}
# alias Gameday.Teams.Game

if Repo.get(Team, "mets") == nil do
  Repo.insert!(%Team{id: "nym", name: "mets", location: "new york"})
  Repo.insert!(%Team{id: "nyy", name: "yankees", location: "new york"})
end
