defmodule TimeManagerWeb.WorkingtimeController do
  use TimeManagerWeb, :controller

  alias TimeManager.Management
  alias TimeManager.Management.Workingtime

  action_fallback TimeManagerWeb.FallbackController

  def index(conn, _params) do
    workingtimes = Management.list_workingtimes()
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def create(conn, %{"workingtime" => workingtime_params}) do
    with {:ok, %Workingtime{} = workingtime} <- Management.create_workingtime(workingtime_params) do
      conn
      |> put_status(:created)
      |> render("show.json", workingtime: workingtime)
    end
  end

  def show(conn, %{"userID" => id, "start" => start, "end" => ennd}) do
    workingtime = Management.list_workingtimes_schedule(id, start, ennd)
    render(conn, "show.json", workingtime: workingtime)
  end

  def show(conn, %{"id" => id}) do
    user = Management.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def index(conn, _params) do
    users = Management.list_users()
    render(conn, "index.json", users: users)
  end

  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = Management.get_workingtime!(id)

    with {:ok, %Workingtime{} = workingtime} <- Management.update_workingtime(workingtime, workingtime_params) do
      render(conn, "show.json", workingtime: workingtime)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtime = Management.get_workingtime!(id)

    with {:ok, %Workingtime{}} <- Management.delete_workingtime(workingtime) do
      send_resp(conn, :no_content, "")
    end
  end
end
