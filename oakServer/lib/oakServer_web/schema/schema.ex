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
    field :users, list_of(:user_type) do
      resolve(&Resolvers.UserResolver.get_all_users/3)
    end

    @desc "Get Me"
    field :get_me, :user_type do
      resolve(&Resolvers.UserResolver.get_me/3)
    end
  end
end
