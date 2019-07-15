defmodule Gameday.TeamsTest do
  use Gameday.DataCase

  alias Gameday.Teams

  describe "teams" do
    alias Gameday.Teams.Team

    @valid_attrs %{name: "some name", location: "some location"}
    @update_attrs %{name: "some updated name", location: "some updated location"}
    @invalid_attrs %{id: nil, name: nil, location: nil}

    test "list_teams/0 returns all teams" do
      team = insert(:team)
      assert Teams.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = insert(:team)
      assert Teams.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      assert {:ok, %Team{} = team} = Teams.create_team(params_for(:team, @valid_attrs))
      assert team.name == "some name"
      assert team.location == "some location"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Teams.create_team(params_for(:team, @invalid_attrs))
    end

    test "update_team/2 with valid data updates the team" do
      team = insert(:team)
      assert {:ok, %Team{} = team} = Teams.update_team(team, @update_attrs)
      assert team.name == "some updated name"
      assert team.location == "some updated location"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = insert(:team)
      assert {:error, %Ecto.Changeset{}} = Teams.update_team(team, @invalid_attrs)
      assert team == Teams.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = insert(:team)
      assert {:ok, %Team{}} = Teams.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Teams.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = insert(:team)
      assert %Ecto.Changeset{} = Teams.change_team(team)
    end
  end
end
