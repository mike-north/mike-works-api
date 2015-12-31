defmodule Mikeworks.Router do
  use Mikeworks.Web, :router

  # pipeline :browser do
  #   plug :accepts, ["html"]
  #   plug :fetch_session
  #   plug :fetch_flash
  #   plug :protect_from_forgery
  #   plug :put_secure_browser_headers
  # end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Mikeworks do
    pipe_through :api
    scope "/v1", V1, as: :v1 do
      resources "/trips", TripController
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", Mikeworks do
  #   pipe_through :api
  # end
end
