defmodule OakServerWeb.Router do
  use OakServerWeb, :router
  alias OakServerWeb.AuthController

  alias OakServerWeb.AuthController
  alias OakServerWeb.Plugs.PopulateAuth
  alias OakServerWeb.Plugs.ProtectGraphql

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug PopulateAuth
  end

  pipeline :graphql do
    plug :accepts, ["json"]
    plug :fetch_session
    plug ProtectGraphql
  end

  scope "/api" do
    pipe_through :api
    post "/auth/register", AuthController, :register
    post "/auth/login", AuthController, :login
    delete "/auth/logout", AuthController, :logout
    get "/auth/getme", AuthController, :getme
  end

  pipeline :graphql do
    plug(:accepts, ["json"])
  end

  scope "/api" do
    pipe_through(:api)
    post("/auth/register", AuthController, :register)
  end

  scope "/api/graphql" do
    pipe_through :graphql

    get "/", Absinthe.Plug.GraphiQL,
      schema: OakServerWeb.Schema,
      interface: :playground

    post "/", Absinthe.Plug.GraphiQL, schema: OakServerWeb.Schema
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through([:fetch_session, :protect_from_forgery])

      live_dashboard("/dashboard", metrics: OakServerWeb.Telemetry)
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through([:fetch_session, :protect_from_forgery])

      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
