defmodule OakServerWeb.Schema.Resolvers.UserResolver do
  alias OakServer.Auth

  def get_all_users(_, _, _) do
    users = Auth.list_users()
    {:ok, users}
  end
end
