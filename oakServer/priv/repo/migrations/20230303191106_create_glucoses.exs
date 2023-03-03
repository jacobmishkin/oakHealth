defmodule OakServer.Repo.Migrations.CreateGlucoses do
  use Ecto.Migration

  def change do
    create table(:glucoses) do
      add :sugar, :integer
      add :time, :utc_datetime_usec
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:glucoses, [:user_id])
  end
end
