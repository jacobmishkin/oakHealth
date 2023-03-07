defmodule OakServerWeb.Schema.Types.GlucoseType do
  use Absinthe.Schema.Notation
  import_types(Absinthe.Type.Custom)

  object :glucose_type do
    field :id, :id
    field :user_id, :id
    field :user, :user_type
    field :sugar, non_null(:integer)
    field :time, non_null(:naive_datetime)
    field :inserted_at, :string
  end

  input_object :glucose_input_type do
    field :sugar, non_null(:integer)
    field :time, non_null(:naive_datetime)
  end
end
