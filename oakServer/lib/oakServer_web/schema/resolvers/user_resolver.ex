defmodule OakServerWeb.Schema.Resolvers.UserResolver do
  alias OakServer.Auth

  # Here for learning
  def get_all_users(_, _, %{context: _context}) do
    users = Auth.list_users()
    {:ok, users}
  end

  def get_me(_, _, %{context: %{current_user: current_user}}) do
    {:ok, current_user}
  end
end
