defmodule WithProcessTest do
  use ExUnit.Case

  test "initializing the counter" do
    {:ok, pid} = Counter.start(0)
    assert is_pid(pid)
  end

  test "getting the value" do
    {:ok, pid} = Counter.start(0)
    assert 0 = Counter.get_value(pid)
  end

  test "incrementing the value" do
    {:ok, pid} = Counter.start(0)
    Counter.increment(pid)
    assert 1 = Counter.get_value(pid)
  end

  test "decrementing the value" do
    {:ok, pid} = Counter.start(3)
    Counter.decrement(pid)
    assert 2 = Counter.get_value(pid)
  end
end
