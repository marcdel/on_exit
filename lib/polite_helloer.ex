defmodule PoliteHelloer do
  defstruct []

  defimpl Helloer do
    def say_hello(_helloer, name) do
      IO.puts("Hello, #{name}!")
    end
  end
end
