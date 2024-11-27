defmodule OnExitTest do
  use ExUnit.Case
  doctest OnExit

  setup do
    helloer = ProtoMock.new(Helloer)

    on_exit(fn ->
      if Process.alive?(helloer.pid) |> dbg() do
        ProtoMock.verify!(helloer)
      end
    end)

    %{helloer: helloer}
  end

  test "greets the world", %{helloer: helloer} do
    ProtoMock.expect(helloer, &Helloer.say_hello/2, fn _ -> "Oh hai, friend." end)

    assert OnExit.hello(helloer, "world") == "Oh hai, friend."
  end
end
