defmodule OakServerWeb.Schema.Types do
  use Absinthe.Schema.Notation

  import_types(OakServerWeb.Schema.Types.UserType)
  import_types(OakServerWeb.Schema.Types.GlucoseType)
end
