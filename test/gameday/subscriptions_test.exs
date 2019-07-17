defmodule Gameday.SubscriptionsTest do
  use Gameday.DataCase

  alias Gameday.Subscriptions

  describe "subscriptions" do
    alias Gameday.Subscriptions.Subscription

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def subscription_fixture(attrs \\ %{}) do
      {:ok, subscription} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Subscriptions.create_subscription()

      subscription
    end

    test "list_subscriptions/0 returns all subscriptions" do
      subscription = subscription_fixture()
      assert Subscriptions.list_subscriptions() == [subscription]
    end

    test "get_subscription!/1 returns the subscription with given id" do
      subscription = subscription_fixture()
      assert Subscriptions.get_subscription!(subscription.id) == subscription
    end

    test "create_subscription/1 with valid data creates a subscription" do
      assert {:ok, %Subscription{} = subscription} = Subscriptions.create_subscription(@valid_attrs)
    end

    test "create_subscription/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Subscriptions.create_subscription(@invalid_attrs)
    end

    test "update_subscription/2 with valid data updates the subscription" do
      subscription = subscription_fixture()
      assert {:ok, %Subscription{} = subscription} = Subscriptions.update_subscription(subscription, @update_attrs)
    end

    test "update_subscription/2 with invalid data returns error changeset" do
      subscription = subscription_fixture()
      assert {:error, %Ecto.Changeset{}} = Subscriptions.update_subscription(subscription, @invalid_attrs)
      assert subscription == Subscriptions.get_subscription!(subscription.id)
    end

    test "delete_subscription/1 deletes the subscription" do
      subscription = subscription_fixture()
      assert {:ok, %Subscription{}} = Subscriptions.delete_subscription(subscription)
      assert_raise Ecto.NoResultsError, fn -> Subscriptions.get_subscription!(subscription.id) end
    end

    test "change_subscription/1 returns a subscription changeset" do
      subscription = subscription_fixture()
      assert %Ecto.Changeset{} = Subscriptions.change_subscription(subscription)
    end
  end

  describe "users" do
    alias Gameday.Subscriptions.User

    @valid_attrs %{phone_number: "some phone_number"}
    @update_attrs %{phone_number: "some updated phone_number"}
    @invalid_attrs %{phone_number: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Subscriptions.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Subscriptions.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Subscriptions.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Subscriptions.create_user(@valid_attrs)
      assert user.phone_number == "some phone_number"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Subscriptions.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Subscriptions.update_user(user, @update_attrs)
      assert user.phone_number == "some updated phone_number"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Subscriptions.update_user(user, @invalid_attrs)
      assert user == Subscriptions.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Subscriptions.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Subscriptions.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Subscriptions.change_user(user)
    end
  end
end
