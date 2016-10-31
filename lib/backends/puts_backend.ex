defmodule Backends.PutsBackend do
  @moduledoc """
  PutsBackend implements a GenEvent handler for the elixir Logger.

  It simple uses IO.puts on the log message.
  """

  @behaviour :gen_event

  def init(_) do
    {:ok, nil}
  end

  def handle_call({:configure, _}, state) do
    {:ok, :ok, state}
  end

  def handle_event({_level, gl, _event}, state)
  when node(gl) != node() do
    {:ok, state}
  end

  def handle_event({_level, _gl, {Logger, msg, ts, md}}, state) do
    IO.puts(:stdio, msg)
    {:ok, state}
  end

  def handle_event(_, state) do
    {:ok, state}
  end

  def handle_info(_, state) do
    {:ok, state}
  end

  def code_change(_old_vsn, state, _extra) do
    {:ok, state}
  end

  def terminate(_reason, _state) do
    :ok
  end
end
