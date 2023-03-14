defmodule OakServerWeb.Constants do
  @internal_server_error "Internal Server Error"
  @invalid_credentials "Invalid Credentials"
  @not_authenticated "Not Authenticated"
  @not_authorized "Not Authorized"
  @not_found "404 Not Found"

  def invalid_credentials, do: @invalid_credentials

  def internal_server_error, do: @internal_server_error

  def not_authenticated, do: @not_authenticated

  def not_authorized, do: @not_authorized

  def not_found, do: @not_found
end
