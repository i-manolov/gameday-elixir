defmodule Gameday.Repo do
  use Ecto.Repo,
    otp_app: :gameday,
    adapter: Ecto.Adapters.Postgres
end
