defmodule Gameday.ScheduleTest do
  use Gameday.DataCase

  alias Gameday.Schedule

  describe "games" do
    alias Gameday.Schedule.Game

    @valid_attrs %{scheduled_datetime: "2010-04-17T14:00:00Z"}
    @update_attrs %{scheduled_datetime: "2011-05-18T15:01:01Z"}
    @invalid_attrs %{scheduled_datetime: nil}
    setup do
      team = insert(:team)

      {:ok, home_team_id: team.id}
    end

    def game_fixture(context) do
      insert(:game, home_team_id: context.home_team_id)
    end

    test "list_games/0 returns all games", context do
      game = game_fixture(context)
      assert Schedule.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id", context do
      game = game_fixture(context)
      assert Schedule.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game", context do
      assert {:ok, %Game{} = game} =
               Schedule.create_game(
                 params_for(
                   :game,
                   Map.put(@valid_attrs, :home_team_id, context.home_team_id)
                 )
               )

      assert game.scheduled_datetime == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_game/1 with invalid data returns error changeset", context do
      assert {:error, %Ecto.Changeset{}} =
               Schedule.create_game(
                 params_for(:game, scheduled_datetime: nil, home_team_id: context.home_team_id)
               )
    end

    test "update_game/2 with valid data updates the game", context do
      game = game_fixture(context)
      assert {:ok, %Game{} = game} = Schedule.update_game(game, @update_attrs)
      assert game.scheduled_datetime == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_game/2 with invalid data returns error changeset", context do
      game = game_fixture(context)
      assert {:error, %Ecto.Changeset{}} = Schedule.update_game(game, @invalid_attrs)
      assert game == Schedule.get_game!(game.id)
    end

    test "delete_game/1 deletes the game", context do
      game = game_fixture(context)
      assert {:ok, %Game{}} = Schedule.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Schedule.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset", context do
      game = game_fixture(context)
      assert %Ecto.Changeset{} = Schedule.change_game(game)
    end
  end
end
