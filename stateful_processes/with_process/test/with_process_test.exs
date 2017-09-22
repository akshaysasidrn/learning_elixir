defmodule WithProcessTest do
  use ExUnit.Case

  test "initializing the counter" do
    {:ok, pid} = Counter.start(0)
    assert is_pid(pid)
  end

  test "getting the value" do
    {:ok, pid} = Counter.start(0)
    assert {:ok, 0} = Counter.get_value(pid)
  end

  test "incrementing the value" do
    {:ok, pid} = Counter.start(0)
    assert {:ok, 1} = Counter.increment(pid)
  end

  test "decrementing the value" do
    {:ok, pid} = Counter.start(2)
    assert {:ok, 1} = Counter.decrement(pid)
  end
end
