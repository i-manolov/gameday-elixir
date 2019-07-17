{:ok, _} = Application.ensure_all_started(:ex_machina)
ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Gameday.Repo, :manual)

Mox.defmock(Gameday.Schedule.MlbApiClient.Mock, for: Tesla.Adapter)
