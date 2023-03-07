defmodule OakServer.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias OakServer.Auth.User
  alias OakServer.Glycemia.Glucose

  schema "users" do
    field(:email, :string)
    field(:name, :string)
    field(:password, :string)
    field(:username, :string)

    has_many :glucoses, :glucose

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :username, :password])
    |> validate_required([:name, :email, :username, :password])
    |> unique_constraint(:username, message: "is already taken")
    |> validate_format(:email, ~r/@/)
    |> update_change(:email, fn email -> String.downcase(email) end)
    |> update_change(:username, fn username -> String.downcase(username) end)
    |> unique_constraint(:email, message: "is not valid")
    |> validate_length(:password, min: 6, max: 16)
    |> validate_length(:name, min: 3, max: 16)
    |> validate_length(:username, min: 3, max: 16)
    |> hash_password
  end

  def login_changeset(attrs) do
    %User{}
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
    |> update_change(:username, &String.downcase/1)
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
