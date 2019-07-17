defmodule Gameday.Schedule.FetchWorker do
  @moduledoc """
  This module is responsible for scheduling and fetching
  the MLB schedule daily for the teams in the database.
  """

  use GenServer

  require Logger

  alias Gameday.Schedule

  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    Logger.debug("***First job*** Running at: " <> DateTime.to_string(DateTime.utc_now()))

    save_current_season_schedule()

    schedule_work()

    {:ok, state}
  end

  def handle_info(:work, state) do
    Logger.debug("***Scheduled job*** Running at: " <> DateTime.to_string(DateTime.utc_now()))

    save_current_season_schedule()

    schedule_work()
    {:noreply, state}
  end

  defp schedule_work do
    now = Timex.now()
    waiting_period = calculate_waiting_period(now)

    Logger.info(
      "***Scheduling*** Next job: " <>
        DateTime.to_string(Timex.add(now, Timex.Duration.from_milliseconds(waiting_period)))
    )

    Process.send_after(self(), :work, waiting_period)
  end

  def calculate_waiting_period(now) do
    now
    |> Timex.shift(days: 1)
    |> Timex.beginning_of_day()
    |> Timex.shift(seconds: 1)
    |> Timex.diff(now, :milliseconds)
  end

  defp save_current_season_schedule do
    Schedule.save_mlb_season(Timex.now().year)
  end
end
