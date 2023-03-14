defmodule OakServer.Repo.Migrations.CreateGlucoses do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:glucoses) do
      add :sugar, :integer, null: false
      add :time, :naive_datetime, null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create_if_not_exists(index(:glucoses, [:user_id]))
  end
end

# last_login_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
# def change do
#   create_if_not_exists table(:list_code) do
#     add :value, :string, null: false, primary_key: true
#     add :name, :string, null: false
#     add :description, :string
#     add :active, :boolean, default: true
#     timestamps(autogenerate: true)
#   end
#   create_if_not_exists unique_index(:list_code, [:value])
#   create constraint("list_code", :must_be_alphanumeric, check: ~s|value not like '%[^A-z0-9]%'|, comment: "List codes must be alphanumeric")
# end
