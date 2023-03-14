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
    input_with_user_id = Map.merge(input, %{user_id: context.current_user.id})

    case Glycemia.create_glucose(input_with_user_id) do
      {:ok, _glucose} ->
        {:ok, true}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:error, Utils.format_changeset_errors(changeset)}

      _ ->
        {:error, Constants.internal_server_error()}
    end
  end

  def delete_glucose(_, %{input: input}, %{context: context}) do
    case Glycemia.delete_glucose_by_id(input.glucose_id, context.current_user.id) do
      {1, _} ->
        {:ok, true}

      {0, _} ->
        {:error, Constants.not_found()}

      _ ->
        {:error, Constants.internal_server_error()}
    end
  end
end
