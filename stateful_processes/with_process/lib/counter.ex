defmodule Counter do
  def start(initial_value) do
    {:ok, spawn(Counter, :loop, [initial_value])}
  end

  def loop(value) do
    receive do
      {from, ref, :get_value} ->
        send(from, {:ok, ref, value})
        loop(value)
      {from, ref, :increment} ->
        value = value + 1
        send(from, {:ok, ref, value})
        loop(value)
      {from, ref, :decrement} ->
        value = value - 1
        send(from, {:ok, ref, value})
        loop(value)
    end
  end

  def get_value(pid) do
    ref = make_ref()
    send(pid, {self(), ref, :get_value})
    receive do
      {:ok, ^ref, val} -> {:ok, val}
    end
  end

  def increment(pid) do
    ref = make_ref()
    send(pid, {self(), ref, :increment})
    receive do
      {:ok, ^ref, val} -> {:ok, val}
    end
  end

  def decrement(pid) do
    ref = make_ref()
    send(pid, {self(), ref, :decrement})
    receive do
      {:ok, ^ref, val} -> {:ok, val}
    end
  end
end
