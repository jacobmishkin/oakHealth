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
    |> validate_length(:password, min: 3, max: 16)
    |> validate_length(:name, min: 3, max: 16)
    |> validate_length(:username, min: 3, max: 16)
    |> hash_password
  end

  defp hash_password(%Ecto.Changeset{} = changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        new_changes = put_change(changeset, :password, Argon2.hash_pwd_salt(password))

      new_changeset ->
        changeset
    end
  end
end