defmodule OnExit.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Registry, keys: :unique, name: HelloerRegistry},
      {DynamicSupervisor, strategy: :one_for_one, name: HelloerSupervisor},
      {Task.Supervisor, name: HelloerTaskSupervisor}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OnExit.Supervisor]
    Supervisor.start_link(children, opts)
  end
end