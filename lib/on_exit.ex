defmodule OnExit do
  @spec hello(Helloer.t(), String.t()) :: String.t()
  def hello(helloer, name) do
    Helloer.say_hello(helloer, name)
  end
end
