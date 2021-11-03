defmodule TimeManagerWeb.Router do
  use TimeManagerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug(CORSPlug, origin: ["*"])
  end

  scope "/", TimeManagerWeb do
    pipe_through :api

    get "/index", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", TimeManagerWeb do
    pipe_through :api

    scope "/users" do
      get "/all", UserController, :index
      get "/", UserController, :show
      get "/:userID", UserController, :show
      post "/", UserController, :create
      put "/:userID", UserController, :update
      delete "/:userID", UserController, :delete
      options "/", UserController, :options
      options "/:userID", UserController, :options
      put "/:userID/promote", UserController, :promote
      options "/:userID/promote", UserController, :options
    end

    scope "/workingtimes" do
      get "/:user_id", WorkingtimeController, :show
      get "/:user_id/:id", WorkingtimeController, :show
      post "/:user_id", WorkingtimeController, :create
      put "/:id", WorkingtimeController, :update
      delete "/:id", WorkingtimeController, :delete
      options "/", WorkingtimeController, :options
      options "/:userID", WorkingtimeController, :options
      options "/:userID/:id", WorkingtimeController, :options
    end

    scope "/clocks" do
      get "/:user_id", ClockController, :show
      post "/:user_id", ClockController, :create
      options "/:userID", ClockController, :options
    end
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
      pipe_through :api
      live_dashboard "/dashboard", metrics: TimeManagerWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :api

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
