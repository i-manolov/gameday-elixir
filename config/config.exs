# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gameday,
  ecto_repos: [Gameday.Repo]

# Configures the endpoint
config :gameday, GamedayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "r1fp6cCwLv3kNanGlBwzfdWcPt11Fxbi2oYcMraPQ5O0GDWapQjS1c+L625H7Lhv",
  render_errors: [view: GamedayWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Gameday.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :tesla, adapter: Tesla.Adapter.Hackney

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, [default_scope: "user:email"]}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: Map.fetch!(System.get_env(), "GITHUB_CLIENT_ID"),
  client_secret: Map.fetch!(System.get_env(), "GITHUB_CLIENT_SECRET")


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
