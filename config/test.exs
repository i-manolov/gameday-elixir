use Mix.Config

# Configure your database
config :gameday, Gameday.Repo,
  username: "postgres",
  password: "postgres",
  database: "gameday_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :gameday, GamedayWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :tesla, Gameday.Schedule.MlbApiClient, adapter: Gameday.Schedule.MlbApiClient.Mock
