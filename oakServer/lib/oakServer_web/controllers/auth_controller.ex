defmodule OakServerWeb.AuthController do
  use OakServerWeb, :controller
  alias OakServer.Auth
  alias OakServerWeb.Utils
  alias OakServerWeb.Constants

  def register(conn, params) do
    def register_user(_, %{input: input}, _) do
      case Auth.create_user(params) do
        {:ok, _} ->
          render(conn, "acknowledge.json", %{success: true, message: "Registered"})

        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "acknowledge.json", %{
            success: false,
            errors: Utils.format_changeset_errors(changeset)
          })

        {_, _} ->
          render(conn, "acknowledge.json", %{
            success: false,
            message: Constants.internal_server_error()
          })
      end
    end
  end
end
