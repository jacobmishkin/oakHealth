defmodule OakServer.GlycemiaTest do
  use OakServer.DataCase

  alias OakServer.Glycemia

  describe "glucoses" do
    alias OakServer.Glycemia.Glucose

    import OakServer.GlycemiaFixtures

    @invalid_attrs %{sugar: nil, time: nil}

    test "list_glucoses/0 returns all glucoses" do
      glucose = glucose_fixture()
      assert Glycemia.list_glucoses() == [glucose]
    end

    test "get_glucose!/1 returns the glucose with given id" do
      glucose = glucose_fixture()
      assert Glycemia.get_glucose!(glucose.id) == glucose
    end

    test "create_glucose/1 with valid data creates a glucose" do
      valid_attrs = %{sugar: 42, time: ~U[2023-03-02 19:11:00.000000Z]}

      assert {:ok, %Glucose{} = glucose} = Glycemia.create_glucose(valid_attrs)
      assert glucose.sugar == 42
      assert glucose.time == ~U[2023-03-02 19:11:00.000000Z]
    end

    test "create_glucose/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Glycemia.create_glucose(@invalid_attrs)
    end

    test "update_glucose/2 with valid data updates the glucose" do
      glucose = glucose_fixture()
      update_attrs = %{sugar: 43, time: ~U[2023-03-03 19:11:00.000000Z]}

      assert {:ok, %Glucose{} = glucose} = Glycemia.update_glucose(glucose, update_attrs)
      assert glucose.sugar == 43
      assert glucose.time == ~U[2023-03-03 19:11:00.000000Z]
    end

    test "update_glucose/2 with invalid data returns error changeset" do
      glucose = glucose_fixture()
      assert {:error, %Ecto.Changeset{}} = Glycemia.update_glucose(glucose, @invalid_attrs)
      assert glucose == Glycemia.get_glucose!(glucose.id)
    end

    test "delete_glucose/1 deletes the glucose" do
      glucose = glucose_fixture()
      assert {:ok, %Glucose{}} = Glycemia.delete_glucose(glucose)
      assert_raise Ecto.NoResultsError, fn -> Glycemia.get_glucose!(glucose.id) end
    end

    test "change_glucose/1 returns a glucose changeset" do
      glucose = glucose_fixture()
      assert %Ecto.Changeset{} = Glycemia.change_glucose(glucose)
    end
  end
end
