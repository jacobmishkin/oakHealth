defmodule OakServer.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:email, :string)
    field(:name, :string)
    field(:password, :string)
    field(:username, :string)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :username, :password])
    |> validate_required([:name, :email, :username, :password])
    |> unique_constraint(:username, message: "username already taken")
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email, message: "This email is not valid")
    |> hash_password
  end

  defp hash_password(changeset) do
    IO.puts("changeset => ")
    IO.inspect(changeset)
    changeset
  end
end
