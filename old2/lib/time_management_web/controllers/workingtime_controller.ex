defmodule TimeManagementWeb.WorkingtimeController do
  use TimeManagementWeb, :controller

  alias TimeManagement.Management
  alias TimeManagement.Management.Workingtime

  action_fallback TimeManagementWeb.FallbackController

  def index(conn, _params) do
    workingtimes = Management.list_workingtimes()
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def create(conn, %{"workingtime" => workingtime_params}) do
    with {:ok, %Workingtime{} = workingtime} <- Management.create_workingtime(workingtime_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.workingtime_path(conn, :show, workingtime))
      |> render("show.json", workingtime: workingtime)
    end
  end

  def show(conn, %{"id" => id}) do
    workingtime = Management.get_workingtime!(id)
    render(conn, "show.json", workingtime: workingtime)
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
