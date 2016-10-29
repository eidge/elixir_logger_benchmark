# NLOGS=1 NTASKS=4 mix run bench/noop_backend.exs
Code.require_file "logger_bench.exs", __DIR__

logs = 100_000 * String.to_integer(System.get_env("NLOGS") || "1")
tasks = String.to_integer System.get_env("NTASKS") || "4"

Logger.remove_backend(:console)
Logger.add_backend(Backends.VerySlowBackend)
[Backends.VerySlowBackend] = Logger.Config.backends

# This will take for ever
time = LoggerBench.run(logs, tasks)
IO.puts "#{time}us (#{logs / (time / 1_000_000)} logs/s)"

