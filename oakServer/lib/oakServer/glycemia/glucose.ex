defmodule OakServer.Glycemia.Glucose do
  use Ecto.Schema
  import Ecto.Changeset
  alias OakServer.Auth.User

  schema "glucoses" do
    field :sugar, :integer
    field :time, :utc_datetime_usec

    belongs_to :users, User

    timestamps()
  end

  @doc false
  def changeset(glucose, attrs) do
    glucose
    |> cast(attrs, [:sugar, :time, :user_id])
    |> validate_required([:sugar, :time])
  end
end
