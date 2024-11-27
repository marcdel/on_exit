defmodule OnExit do
  @spec hello(Helloer.t(), String.t()) :: String.t()
  def hello(helloer, name) do
    HelloWorker.start_worker()
    Helloer.say_hello(helloer, name)
  end
end
