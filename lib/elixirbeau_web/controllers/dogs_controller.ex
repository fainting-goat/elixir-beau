defmodule ElixirbeauWeb.DogsController do
  use ElixirbeauWeb, :controller

  alias Elixirbeau.Pets
  alias Elixirbeau.Pets.Dogs

  def index(conn, _params) do
    dog = Pets.list_dog()
    render(conn, "index.html", dog: dog)
  end

  def new(conn, _params) do
    changeset = Pets.change_dogs(%Dogs{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"dogs" => dogs_params}) do
    case Pets.create_dogs(dogs_params) do
      {:ok, dogs} ->
        conn
        |> put_flash(:info, "Dogs created successfully.")
        |> redirect(to: Routes.dogs_path(conn, :show, dogs))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dogs = Pets.get_dogs!(id)
    render(conn, "show.html", dogs: dogs)
  end

  def edit(conn, %{"id" => id}) do
    dogs = Pets.get_dogs!(id)
    changeset = Pets.change_dogs(dogs)
    render(conn, "edit.html", dogs: dogs, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dogs" => dogs_params}) do
    dogs = Pets.get_dogs!(id)

    case Pets.update_dogs(dogs, dogs_params) do
      {:ok, dogs} ->
        conn
        |> put_flash(:info, "Dogs updated successfully.")
        |> redirect(to: Routes.dogs_path(conn, :show, dogs))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", dogs: dogs, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dogs = Pets.get_dogs!(id)
    {:ok, _dogs} = Pets.delete_dogs(dogs)

    conn
    |> put_flash(:info, "Dogs deleted successfully.")
    |> redirect(to: Routes.dogs_path(conn, :index))
  end
end
