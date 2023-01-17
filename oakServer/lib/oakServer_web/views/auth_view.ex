defmodule OakServerWeb.AuthView do
  use OakServerWeb, :view

  def render("acknowledge.json", %{message: message}) do
    %{success: true, message: message}
  end

  def render("errors.json", %{errors: error}) do
    %{success: false, errors: error}
  end
end
