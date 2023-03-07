defmodule OakServerWeb.Schema.Resolvers.GlucoseResolver do
  alias OakServer.Glycemia
  alias OakServerWeb.Utils
  alias OakServerWeb.Constants

  # Here for learning
  def get_all_glucoses(_, _, %{context: _context}) do
    glucoses = Glycemia.list_glucoses()
    {:ok, glucoses}
  end

  def create_glucose(_, %{input: input}, %{context: context}) do
    case Glycemia.create_glucose(input) do
      {:ok, _glucose} ->
        {:ok, true}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:error, Utils.format_changeset_errors(changeset)}

      _ ->
        {:error, Constants.internal_server_error()}
    end
  end
end
