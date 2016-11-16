defmodule Slark.Router do
  use Slark.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Slark do
    pipe_through :api
  end
end
