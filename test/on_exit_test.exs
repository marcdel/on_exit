defmodule OnExitTest do
  use ExUnit.Case
  doctest OnExit

  test "greets the world" do
    assert OnExit.hello() == :world
  end
end
