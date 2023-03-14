defmodule OakServer.Glycemia do
  @moduledoc """
  The Glycemia context.
  """

  import Ecto.Query, warn: false
  alias OakServer.Repo

  alias OakServer.Glycemia.Glucose

  @doc """
  Returns the list of glucoses.

  ## Examples

      iex> list_glucoses()
      [%Glucose{}, ...]

  """
  def list_glucoses do
    Repo.all(from(g in Glucose, preload: [:user]))
  end

  @doc """
  Gets a single glucose.

  Raises `Ecto.NoResultsError` if the Glucose does not exist.

  ## Examples

      iex> get_glucose!(123)
      %Glucose{}

      iex> get_glucose!(456)
      ** (Ecto.NoResultsError)

  """
  def get_glucose!(id), do: Repo.get!(Glucose, id)

  @doc """
  Creates a glucose.

  ## Examples

      iex> create_glucose(%{field: value})
      {:ok, %Glucose{}}

      iex> create_glucose(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_glucose(attrs \\ %{}) do
    %Glucose{}
    |> Glucose.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a glucose.

  ## Examples

      iex> update_glucose(glucose, %{field: new_value})
      {:ok, %Glucose{}}

      iex> update_glucose(glucose, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_glucose(%Glucose{} = glucose, attrs) do
    glucose
    |> Glucose.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a glucose.

  ## Examples

      iex> delete_glucose(glucose)
      {:ok, %Glucose{}}

      iex> delete_glucose(glucose)
      {:error, %Ecto.Changeset{}}

  """
  def delete_glucose(%Glucose{} = glucose) do
    Repo.delete(glucose)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking glucose changes.

  ## Examples

      iex> change_glucose(glucose)
      %Ecto.Changeset{data: %Glucose{}}

  """
  def change_glucose(%Glucose{} = glucose, attrs \\ %{}) do
    Glucose.changeset(glucose, attrs)
  end
end
