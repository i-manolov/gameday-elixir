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
    current_date_time = Timex.now()

    next_day_date_time =
      current_date_time
      |> Timex.shift(days: 1)
      |> Timex.beginning_of_day()

    Logger.debug("***Scheduling*** Running at: " <> DateTime.to_string(DateTime.utc_now()))

    waiting_period = Timex.diff(next_day_date_time, current_date_time, :milliseconds)

    Logger.debug(
      "***Scheduling*** Next job: " <>
        DateTime.to_string(
          Timex.add(current_date_time, Timex.Duration.from_milliseconds(waiting_period))
        )
    )

    Process.send_after(self(), :work, waiting_period)
  end

  defp save_current_season_schedule do
    Schedule.save_mlb_season(Timex.now().year)
  end
end
