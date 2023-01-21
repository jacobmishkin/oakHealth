defmodule OakServerWeb.AuthController do
  use OakServerWeb, :controller
  alias OakServer.Auth
  alias OakServerWeb.Constants
  alias OakServerWeb.Utils

  def register(conn, params) do
    case Auth.create_user(params) do
      {:ok, _} ->
        render(conn, "acknowledge.json", %{success: true, message: "Registered"})

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "errors.json", %{
          success: false,
          errors: Utils.format_changeset_errors(changeset)
        })

      {_, _} ->
        render(conn, "errors.json", %{
          success: false,
          message: Constants.internal_server_error()
        })
    end
  end
end
