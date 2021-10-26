defmodule TimeManagement.ManagementFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TimeManagement.Management` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        username: "some username"
      })
      |> TimeManagement.Management.create_user()

    user
  end

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~U[2021-10-25 10:26:00Z]
      })
      |> TimeManagement.Management.create_clock()

    clock
  end

  @doc """
  Generate a workingtime.
  """
  def workingtime_fixture(attrs \\ %{}) do
    {:ok, workingtime} =
      attrs
      |> Enum.into(%{
        end: ~U[2021-10-25 10:27:00Z],
        start: ~U[2021-10-25 10:27:00Z]
      })
      |> TimeManagement.Management.create_workingtime()

    workingtime
  end
end
