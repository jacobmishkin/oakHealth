defmodule OakServerWeb.Schema.Types.GlucoseType do
  use Absinthe.Schema.Notation

  object :glucose_type do
    field :id, :id
    field :user_id, :id
    field :sugar, :integer
    field :time, :utc_datetime_usec
    field :inserted_at, :string
  end
end
