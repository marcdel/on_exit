defprotocol Helloer do
  @spec say_hello(t(), String.t()) :: String.t()
  def say_hello(helloer, name)
end
