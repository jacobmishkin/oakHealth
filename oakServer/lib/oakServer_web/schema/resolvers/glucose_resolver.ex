defmodule OakServerWeb.Schema.Resolvers.GlucoseResolver do
  alias OakServer.Glycemia

  # Here for learning
  def get_all_glucoses(_, _, %{context: _context}) do
    glucoses = Glycemia.list_glucoses()
    {:ok, glucoses}
  end
end
