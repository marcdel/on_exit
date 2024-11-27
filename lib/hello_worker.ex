defmodule HelloWorker do
  use GenServer
  def start_worker do
    {:ok, pid} = DynamicSupervisor.start_child(HelloerSupervisor, {__MODULE__, []})
    ref = Process.monitor(pid)

    {:ok, ref}
  end

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state) do
    {:ok, state}
  end
end
