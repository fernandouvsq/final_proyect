defmodule TimeManagerWeb.ClockController do
  use TimeManagerWeb, :controller

  alias TimeManager.Management
  alias TimeManager.Management.Clock

  action_fallback TimeManagerWeb.FallbackController

  def index(conn, _params) do
    clocks = Management.list_clocks()
    render(conn, "index.json", clocks: clocks)
  end

  def create(conn, %{"clock" => clock_params}) do
    with {:ok, %Clock{} = clock} <- Management.create_clock(clock_params) do
      conn
      |> put_status(:created)
      |> render("show.json", clock: clock)
    end
  end

  def show(conn, %{"userID" => id}) do
    clock = Management.get_clock!(id)
    render(conn, "show.json", clock: clock)
  end

  def update(conn, %{"userID" => id, "clock" => clock_params}) do
    clock = Management.get_clock!(id)

    with {:ok, %Clock{} = clock} <- Management.update_clock(clock, clock_params) do
      render(conn, "show.json", clock: clock)
    end
  end

  def delete(conn, %{"userID" => id}) do
    clock = Management.get_clock!(id)

    with {:ok, %Clock{}} <- Management.delete_clock(clock) do
      send_resp(conn, :no_content, "")
    end
  end
end
