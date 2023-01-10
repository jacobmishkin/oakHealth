defmodule OakServer.Repo do
  use Ecto.Repo,
    otp_app: :oakServer,
    adapter: Ecto.Adapters.Postgres
end
