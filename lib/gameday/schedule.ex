defmodule Gameday.Schedule do
  @moduledoc """
  The Schedule context.
  """

  require Logger

  import Ecto.Query, warn: false
  alias Ecto.Multi
  alias Gameday.Repo

  alias Gameday.Schedule.{Game, MlbApiClient}
  alias Gameday.Teams

  @game_on_conflict [
    on_conflict: {:replace, [:scheduled_datetime, :updated_at]},
    conflict_target: [:scheduled_datetime, :home_team_id]
  ]

  @doc """
  Returns the list of games.

  ## Examples

      iex> list_games()
      [%Game{}, ...]

  """
  def list_games do
    Repo.all(Game)
  end

  @doc """
  Gets a single game.

  Raises `Ecto.NoResultsError` if the Game does not exist.

  ## Examples

      iex> get_game!(123)
      %Game{}

      iex> get_game!(456)
      ** (Ecto.NoResultsError)

  """
  def get_game!(id), do: Repo.get!(Game, id)

  @doc """
  Creates a game.

  ## Examples

      iex> create_game(%{field: value})
      {:ok, %Game{}}

      iex> create_game(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_game(attrs \\ %{}) do
    %Game{}
    |> Game.changeset(attrs)
    |> Repo.insert(@game_on_conflict)
  end

  @doc """
  Updates a game.

  ## Examples

      iex> update_game(game, %{field: new_value})
      {:ok, %Game{}}

      iex> update_game(game, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_game(%Game{} = game, attrs) do
    game
    |> Game.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Game.

  ## Examples

      iex> delete_game(game)
      {:ok, %Game{}}

      iex> delete_game(game)
      {:error, %Ecto.Changeset{}}

  """
  def delete_game(%Game{} = game) do
    Repo.delete(game)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking game changes.

  ## Examples

      iex> change_game(game)
      %Ecto.Changeset{source: %Game{}}

  """
  def change_game(%Game{} = game) do
    Game.changeset(game, %{})
  end

  def save_mlb_season(season) do
    Teams.list_teams()
    |> MlbApiClient.get_api_team_codes()
    |> Enum.map(fn team ->
      Task.async(fn -> MlbApiClient.get_api_team_schedule(team, season) end)
    end)
    |> Enum.map(&Task.await/1)
    |> Enum.map(&save_team_season(&1))
  end

  defp save_team_season(games) do
    {:ok, _} =
      games
      |> Enum.map(fn game -> %Game{} |> Game.changeset(game) end)
      |> Enum.with_index()
      |> Enum.reduce(Multi.new(), fn {game_changeset, index}, multi ->
        Multi.insert(
          multi,
          {:game, index},
          game_changeset,
          @game_on_conflict
        )
      end)
      |> Repo.transaction()

    [%{home_team_id: home_team_id} | _rest] = games
    Logger.info("Successfully saved schedule for team #{home_team_id} at #{DateTime.utc_now()}")
  end
end
