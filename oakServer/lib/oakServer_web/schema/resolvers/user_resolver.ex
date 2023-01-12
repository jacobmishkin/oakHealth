defmodule OakServerWeb.Schema.Resolvers.UserResolver do
  alias OakServer.Auth
  alias OakServerWeb.Utils
  alias OakServerWeb.Constants

  def register_user(_, %{input: input}, _) do
    case Auth.create_user(input) do
      {:ok, _} ->
        {:ok, true}

      {:error, %Ecto.Changeset{} = changeset} ->
        errors = Utils.format_changeset_errors(changeset)
        {:error, errors}

      {_, _} ->
        {:error, Constants.internal_server_error()}
    end
  end
end
