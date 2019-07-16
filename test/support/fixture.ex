defmodule Gameday.Fixtures do
  def fixture(:mlb_api_teams) do
    %{
      "copyright" =>
        "Copyright 2019 MLB Advanced Media, L.P.  Use of any content on this page acknowledges agreement to the terms posted here http://gdx.mlb.com/components/copyright.txt",
      "teams" => [
        %{
          "abbreviation" => "NYY",
          "active" => true,
          "allStarStatus" => "N",
          "division" => %{
            "id" => 201,
            "link" => "/api/v1/divisions/201",
            "name" => "American League East"
          },
          "fileCode" => "nyy",
          "firstYearOfPlay" => "1903",
          "id" => 147,
          "league" => %{
            "id" => 103,
            "link" => "/api/v1/league/103",
            "name" => "American League"
          },
          "link" => "/api/v1/teams/147",
          "locationName" => "Bronx",
          "name" => "New York Yankees",
          "shortName" => "NY Yankees",
          "sport" => %{
            "id" => 1,
            "link" => "/api/v1/sports/1",
            "name" => "Major League Baseball"
          },
          "springLeague" => %{
            "abbreviation" => "GL",
            "id" => 115,
            "link" => "/api/v1/league/115",
            "name" => "Grapefruit League"
          },
          "teamCode" => "nya",
          "teamName" => "Yankees",
          "venue" => %{
            "id" => 3313,
            "link" => "/api/v1/venues/3313",
            "name" => "Yankee Stadium"
          }
        },
        %{
          "abbreviation" => "NYM",
          "active" => true,
          "allStarStatus" => "N",
          "division" => %{
            "id" => 204,
            "link" => "/api/v1/divisions/204",
            "name" => "National League East"
          },
          "fileCode" => "nym",
          "firstYearOfPlay" => "1962",
          "id" => 121,
          "league" => %{
            "id" => 104,
            "link" => "/api/v1/league/104",
            "name" => "National League"
          },
          "link" => "/api/v1/teams/121",
          "locationName" => "New York",
          "name" => "New York Mets",
          "shortName" => "NY Mets",
          "sport" => %{
            "id" => 1,
            "link" => "/api/v1/sports/1",
            "name" => "Major League Baseball"
          },
          "springLeague" => %{
            "abbreviation" => "GL",
            "id" => 115,
            "link" => "/api/v1/league/115",
            "name" => "Grapefruit League"
          },
          "teamCode" => "nyn",
          "teamName" => "Mets",
          "venue" => %{
            "id" => 3313,
            "link" => "/api/v1/venues/3313",
            "name" => "Yankee Stadium"
          }
        }
      ]
    }
  end

  def fixture(:mlb_api_schedule) do
    %{
      "copyright" =>
        "Copyright 2019 MLB Advanced Media, L.P.  Use of any content on this page acknowledges agreement to the terms posted here http://gdx.mlb.com/components/copyright.txt",
      "dates" => [
        %{
          "date" => "2019-03-28",
          "events" => [],
          "games" => [
            %{
              "calendarEventID" => "14-565895-2019-03-28",
              "content" => %{"link" => "/api/v1/game/565895/content"},
              "dayNight" => "day",
              "description" => "Nationals home opener",
              "doubleHeader" => "N",
              "gameDate" => "2019-03-28T17:05:00Z",
              "gameNumber" => 1,
              "gamePk" => 565_895,
              "gameType" => "R",
              "gamedayType" => "P",
              "gamesInSeries" => 3,
              "ifNecessary" => "N",
              "ifNecessaryDescription" => "Normal Game",
              "isTie" => false,
              "link" => "/api/v1/game/565895/feed/live",
              "publicFacing" => true,
              "recordSource" => "S",
              "scheduledInnings" => 9,
              "season" => "2019",
              "seasonDisplay" => "2019",
              "seriesDescription" => "Regular Season",
              "seriesGameNumber" => 1,
              "status" => %{
                "abstractGameCode" => "F",
                "abstractGameState" => "Final",
                "codedGameState" => "F",
                "detailedState" => "Final",
                "statusCode" => "F"
              },
              "teams" => %{
                "away" => %{
                  "isWinner" => true,
                  "leagueRecord" => %{"losses" => 0, "pct" => "1.000", "wins" => 1},
                  "score" => 2,
                  "seriesNumber" => 1,
                  "splitSquad" => false,
                  "team" => %{
                    "id" => 121,
                    "link" => "/api/v1/teams/121",
                    "name" => "New York Mets"
                  }
                },
                "home" => %{
                  "isWinner" => false,
                  "leagueRecord" => %{"losses" => 1, "pct" => ".000", "wins" => 0},
                  "score" => 0,
                  "seriesNumber" => 1,
                  "splitSquad" => false,
                  "team" => %{
                    "id" => 120,
                    "link" => "/api/v1/teams/120",
                    "name" => "Washington Nationals"
                  }
                }
              },
              "tiebreaker" => "N",
              "venue" => %{
                "id" => 3309,
                "link" => "/api/v1/venues/3309",
                "name" => "Nationals Park"
              }
            }
          ],
          "totalEvents" => 0,
          "totalGames" => 1,
          "totalGamesInProgress" => 0,
          "totalItems" => 1
        },
        %{
          "date" => "2019-03-30",
          "events" => [],
          "games" => [
            %{
              "calendarEventID" => "14-565896-2019-03-30",
              "content" => %{"link" => "/api/v1/game/565896/content"},
              "dayNight" => "day",
              "doubleHeader" => "N",
              "gameDate" => "2019-03-30T17:05:00Z",
              "gameNumber" => 1,
              "gamePk" => 565_896,
              "gameType" => "R",
              "gamedayType" => "P",
              "gamesInSeries" => 3,
              "ifNecessary" => "N",
              "ifNecessaryDescription" => "Normal Game",
              "isTie" => false,
              "link" => "/api/v1/game/565896/feed/live",
              "publicFacing" => true,
              "recordSource" => "S",
              "scheduledInnings" => 9,
              "season" => "2019",
              "seasonDisplay" => "2019",
              "seriesDescription" => "Regular Season",
              "seriesGameNumber" => 2,
              "status" => %{
                "abstractGameCode" => "F",
                "abstractGameState" => "Final",
                "codedGameState" => "F",
                "detailedState" => "Final",
                "statusCode" => "F"
              },
              "teams" => %{
                "away" => %{
                  "isWinner" => true,
                  "leagueRecord" => %{"losses" => 0, "pct" => "1.000", "wins" => 2},
                  "score" => 11,
                  "seriesNumber" => 1,
                  "splitSquad" => false,
                  "team" => %{
                    "id" => 121,
                    "link" => "/api/v1/teams/121",
                    "name" => "New York Mets"
                  }
                },
                "home" => %{
                  "isWinner" => false,
                  "leagueRecord" => %{"losses" => 2, "pct" => ".000", "wins" => 0},
                  "score" => 8,
                  "seriesNumber" => 1,
                  "splitSquad" => false,
                  "team" => %{
                    "id" => 120,
                    "link" => "/api/v1/teams/120",
                    "name" => "Washington Nationals"
                  }
                }
              },
              "tiebreaker" => "N",
              "venue" => %{
                "id" => 3309,
                "link" => "/api/v1/venues/3309",
                "name" => "Nationals Park"
              }
            }
          ],
          "totalEvents" => 0,
          "totalGames" => 1,
          "totalGamesInProgress" => 0,
          "totalItems" => 1
        }
      ],
      "totalEvents" => 0,
      "totalGames" => 165,
      "totalGamesInProgress" => 0,
      "totalItems" => 165
    }
  end
end
