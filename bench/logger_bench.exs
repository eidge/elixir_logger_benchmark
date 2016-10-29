defmodule LoggerBench do
  require Logger

  def run(log_contents \\ "some log", logs, tasks) do
    logs_per_task = div(logs, tasks)

    {time, _} = :timer.tc(fn ->
      1..tasks
      |> Enum.flat_map(fn _ ->
        Enum.map(1..logs_per_task, fn _ ->
          Task.async(fn -> Logger.info log_contents end)
        end)
      end)
      |> Enum.each(&Task.await(&1, :infinity))
    end)

    time
  end
end

