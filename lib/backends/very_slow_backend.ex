defmodule Backends.VerySlowBackend do
  @moduledoc """
  NoHandle implements a GenEvent handler for the elixir Logger.

  It just discards the events the loggers sents it, so that we can
  benchmark the performance of the Logger itself, rather than its
  backends.
  """

  @behaviour :gen_event

  def init(_) do
    IO.puts("Very slow backend started")
    {:ok, nil}
  end

  def handle_call({:configure, _}, state) do
    {:ok, :ok, state}
  end

  def handle_event({_level, _gl, _event}, state) do
    :timer.sleep 200
    {:ok, state}
  end

  def handle_info(_, state) do
    {:ok, state}
  end

  def code_change(_old_vsn, state, _extra) do
    {:ok, state}
  end

  def terminate(_reason, _state) do
    IO.puts("Very slow backend terminated")
    :ok
  end
end

