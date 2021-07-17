defmodule ElixirbeauWeb.DogsControllerTest do
  use ElixirbeauWeb.ConnCase

  alias Elixirbeau.Pets

  @create_attrs %{age: 42, birthdate: ~D[2010-04-17], is_best_dog: true, name: "some name"}
  @update_attrs %{age: 43, birthdate: ~D[2011-05-18], is_best_dog: false, name: "some updated name"}
  @invalid_attrs %{age: nil, birthdate: nil, is_best_dog: nil, name: nil}

  def fixture(:dogs) do
    {:ok, dogs} = Pets.create_dogs(@create_attrs)
    dogs
  end

  describe "index" do
    test "lists all dog", %{conn: conn} do
      conn = get(conn, Routes.dogs_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Dog"
    end
  end

  describe "new dogs" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.dogs_path(conn, :new))
      assert html_response(conn, 200) =~ "New Dogs"
    end
  end

  describe "create dogs" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.dogs_path(conn, :create), dogs: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.dogs_path(conn, :show, id)

      conn = get(conn, Routes.dogs_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Dogs"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.dogs_path(conn, :create), dogs: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Dogs"
    end
  end

  describe "edit dogs" do
    setup [:create_dogs]

    test "renders form for editing chosen dogs", %{conn: conn, dogs: dogs} do
      conn = get(conn, Routes.dogs_path(conn, :edit, dogs))
      assert html_response(conn, 200) =~ "Edit Dogs"
    end
  end

  describe "update dogs" do
    setup [:create_dogs]

    test "redirects when data is valid", %{conn: conn, dogs: dogs} do
      conn = put(conn, Routes.dogs_path(conn, :update, dogs), dogs: @update_attrs)
      assert redirected_to(conn) == Routes.dogs_path(conn, :show, dogs)

      conn = get(conn, Routes.dogs_path(conn, :show, dogs))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, dogs: dogs} do
      conn = put(conn, Routes.dogs_path(conn, :update, dogs), dogs: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Dogs"
    end
  end

  describe "delete dogs" do
    setup [:create_dogs]

    test "deletes chosen dogs", %{conn: conn, dogs: dogs} do
      conn = delete(conn, Routes.dogs_path(conn, :delete, dogs))
      assert redirected_to(conn) == Routes.dogs_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.dogs_path(conn, :show, dogs))
      end
    end
  end

  defp create_dogs(_) do
    dogs = fixture(:dogs)
    %{dogs: dogs}
  end
end
