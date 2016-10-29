# NLOGS=1 NTASKS=4 mix run bench/console_backend.exs
Code.require_file "logger_bench.exs", __DIR__

logs = 100_000 * String.to_integer(System.get_env("NLOGS") || "1")
tasks = String.to_integer System.get_env("NTASKS") || "4"

[:console] = Logger.Config.backends

time = LoggerBench.run(logs, tasks)
IO.puts "#{time}us (#{logs / (time / 1_000_000)} logs/s)"
