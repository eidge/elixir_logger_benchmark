# ElixirLoggerBenchmark

Logger benchmarks inside ./bench.

Run them with:

```bash
$> NTASKS=4 NLOGS=1 mix run console_backend.exs
$> NTASKS=4 NLOGS=1 mix run noop_backend.exs
$> NTASKS=4 NLOGS=1 mix run slow_backend.exs # takes for ever
```

On my machine (2 core VM inside MacBook Pro i7 @ 2.5GHZ w/ 16GB RAM):

ConsoleBackend: 8700 logs/s
ConsolePutsBackend: 14 500 logs/s
PutsBackend: 17 000 logs/s
NoopBackend: 140 000 logs/s
SlowBackend: 0 logs/s (didn't wait for it to finish)
