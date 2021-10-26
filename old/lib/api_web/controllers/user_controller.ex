defmodule ApiWeb.UserController do
  use ApiWeb, :controller

  def index(conn, _params, user) do
    users = User.all
    render users
  end
end