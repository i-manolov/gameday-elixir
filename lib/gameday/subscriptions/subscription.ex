defmodule Gameday.Subscriptions.Subscription do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subscriptions" do
    field :user_id, :id
    field :team_id, :id

    timestamps()
  end

  @doc false
  def changeset(subscription, attrs) do
    subscription
    |> cast(attrs, [])
    |> validate_required([])
  end
end
