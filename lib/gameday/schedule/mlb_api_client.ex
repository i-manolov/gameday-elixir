defmodule Gameday.Schedule.MlbApiClient do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://statsapi.mlb.com/api/v1"
  plug Tesla.Middleware.JSON

  @baseball_sport_id 1

  def get_teams_with_team_code(saved_team_ids) do
    fetch_teams()
    |> Enum.filter(fn %{"fileCode" => api_team_code} ->
      Enum.member?(saved_team_ids, api_team_code)
    end)
    |> Enum.map(fn %{"id" => id, "fileCode" => api_team_id} ->
      %{api_team_id: id, team_id: api_team_id}
    end)
  end

  def get_api_team_schedule(%{api_team_id: api_team_id, team_id: team_id}, season) do
    api_team_id
    |> fetch_team_dates(season)
    |> Enum.map(fn %{"games" => [game | _tail]} -> game["gameDate"] end)
    |> Enum.map(fn game_date_time ->
      %{home_team_id: team_id, scheduled_datetime: game_date_time}
    end)
  end

  defp fetch_teams do
    {:ok, %Tesla.Env{body: %{"teams" => teams}}} = get("/teams?sportId=#{@baseball_sport_id}")

    teams
  end

  defp fetch_team_dates(team_id, season) do
    start_date = "01/01/#{season}"
    end_date = "12/31/#{season}"

    {:ok, %Tesla.Env{body: %{"dates" => dates}}} =
      get(
        "/schedule?sportId=#{@baseball_sport_id}&startDate=#{start_date}&endDate=#{end_date}&gameType=R&teamId=#{
          team_id
        }"
      )

    dates
  end
end
