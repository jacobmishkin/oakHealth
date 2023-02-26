defmodule OakServerWeb.AuthController do
  use OakServerWeb, :controller

  alias OakServer.Auth
  alias OakServerWeb.Constants
  alias OakServerWeb.Utils
  alias OakServer.Auth.User

  def login(conn, params) do
    case User.login_changeset(params) do
      %Ecto.Changeset{valid?: true, changes: %{username: username, password: password}} ->
        user = Auth.get_by_username(username)

        case user do
          %User{} ->
            case Argon2.verify_pass(password, user.password) do
              true ->
                render(conn, "acknowledge.json", %{message: "Logged In"})

              _ ->
                render(conn, "errors.json", %{errors: Constants.invalid_credentials()})
            end

          _ ->
            render(conn, "errors.json", %{errors: Constants.invalid_credentials()})
        end

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "errors.json", %{
          errors: Utils.format_changeset_errors(changeset)
        })

      {_, _} ->
        render(conn, "errors.json", %{
          message: Constants.internal_server_error()
        })
    end
  end

  def register(conn, params) do
    case Auth.create_user(params) do
      {:ok, _} ->
        render(conn, "acknowledge.json", %{message: "Registered"})

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "errors.json", %{
          errors: Utils.format_changeset_errors(changeset)
        })

      {_, _} ->
        render(conn, "errors.json", %{
          message: Constants.internal_server_error()
        })
    end
  end
end
