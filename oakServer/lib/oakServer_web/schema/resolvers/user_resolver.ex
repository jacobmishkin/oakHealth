defmodule OakServerWeb.Schema.Resolvers.UserResolver do
  alias OakServer.Auth

  def register_user(_, %{input: input}, _) do
    IO.inspect(input)
    res = Auth.create_user(input)
    IO.puts("creat_user res =>")
    IO.inspect(res)
    {:ok, true}
  end
end
