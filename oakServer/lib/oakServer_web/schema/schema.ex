defmodule OakServerWeb.Schema do
  use Absinthe.Schema

  import_types(OakServerWeb.Schema.Types)

  alias OakServerWeb.Schema.Resolvers

  query do
    @desc "greetings"
    field :hello, :string do
      resolve(fn _, _, _ -> {:ok, "world"} end)
    end

    @desc "Get all Users"
    field(:users, list_of(:user_type)) do
      resolve(&Resolvers.UserResolver.get_all_users/3)
    end
  end

  mutation do
    field :register_user, :boolean do
      arg(:input, non_null(:registration_input_type))
      resolve(&Resolvers.UserResolver.register_user/3)
    end
  end
end
