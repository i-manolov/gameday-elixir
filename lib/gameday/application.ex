defmodule Gameday.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    http_workers =
      if Application.get_env(:gameday, :enable_http_workers, false),
        do: [Gameday.Schedule.FetchWorker],
        else: []

    # List all child processes to be supervised
    children =
      [
        # Start the Ecto repository
        Gameday.Repo,
        # Start the endpoint when the application starts
        GamedayWeb.Endpoint
        # Starts a worker by calling: Gameday.Worker.start_link(arg)
        # {Gameday.Worker, arg},
      ] ++ http_workers

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Gameday.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GamedayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
