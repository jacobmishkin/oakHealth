defmodule OakServerWeb.Schema.Resolvers.UserResolver do
  alias OakServer.Auth

  def get_all_users(_, _, %{context: context}) do
    IO.puts("all user Context => ")
    IO.inspect(context)
    users = Auth.list_users()
    {:ok, users}
  end
end
