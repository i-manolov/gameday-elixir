defmodule Gameday.Subscriptions.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :phone_number, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:phone_number])
    |> validate_required([:phone_number])
  end
end
