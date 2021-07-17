defmodule Elixirbeau.Pets do
  @moduledoc """
  The Pets context.
  """

  import Ecto.Query, warn: false
  alias Elixirbeau.Repo

  alias Elixirbeau.Pets.Dogs

  @doc """
  Returns the list of dog.

  ## Examples

      iex> list_dog()
      [%Dogs{}, ...]

  """
  def list_dog do
    Repo.all(Dogs)
  end

  @doc """
  Gets a single dogs.

  Raises `Ecto.NoResultsError` if the Dogs does not exist.

  ## Examples

      iex> get_dogs!(123)
      %Dogs{}

      iex> get_dogs!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dogs!(id), do: Repo.get!(Dogs, id)

  @doc """
  Creates a dogs.

  ## Examples

      iex> create_dogs(%{field: value})
      {:ok, %Dogs{}}

      iex> create_dogs(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dogs(attrs \\ %{}) do
    %Dogs{}
    |> Dogs.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dogs.

  ## Examples

      iex> update_dogs(dogs, %{field: new_value})
      {:ok, %Dogs{}}

      iex> update_dogs(dogs, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dogs(%Dogs{} = dogs, attrs) do
    dogs
    |> Dogs.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a dogs.

  ## Examples

      iex> delete_dogs(dogs)
      {:ok, %Dogs{}}

      iex> delete_dogs(dogs)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dogs(%Dogs{} = dogs) do
    Repo.delete(dogs)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dogs changes.

  ## Examples

      iex> change_dogs(dogs)
      %Ecto.Changeset{data: %Dogs{}}

  """
  def change_dogs(%Dogs{} = dogs, attrs \\ %{}) do
    Dogs.changeset(dogs, attrs)
  end
end
