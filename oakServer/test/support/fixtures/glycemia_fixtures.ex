defmodule OakServer.GlycemiaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `OakServer.Glycemia` context.
  """

  @doc """
  Generate a glucose.
  """
  def glucose_fixture(attrs \\ %{}) do
    {:ok, glucose} =
      attrs
      |> Enum.into(%{
        sugar: 42,
        time: ~U[2023-03-02 19:11:00.000000Z]
      })
      |> OakServer.Glycemia.create_glucose()

    glucose
  end
end
