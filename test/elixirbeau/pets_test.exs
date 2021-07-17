defmodule Elixirbeau.PetsTest do
  use Elixirbeau.DataCase

  alias Elixirbeau.Pets

  describe "dog" do
    alias Elixirbeau.Pets.Dogs

    @valid_attrs %{age: 42, birthdate: ~D[2010-04-17], is_best_dog: true, name: "some name"}
    @update_attrs %{age: 43, birthdate: ~D[2011-05-18], is_best_dog: false, name: "some updated name"}
    @invalid_attrs %{age: nil, birthdate: nil, is_best_dog: nil, name: nil}

    def dogs_fixture(attrs \\ %{}) do
      {:ok, dogs} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pets.create_dogs()

      dogs
    end

    test "list_dog/0 returns all dog" do
      dogs = dogs_fixture()
      assert Pets.list_dog() == [dogs]
    end

    test "get_dogs!/1 returns the dogs with given id" do
      dogs = dogs_fixture()
      assert Pets.get_dogs!(dogs.id) == dogs
    end

    test "create_dogs/1 with valid data creates a dogs" do
      assert {:ok, %Dogs{} = dogs} = Pets.create_dogs(@valid_attrs)
      assert dogs.age == 42
      assert dogs.birthdate == ~D[2010-04-17]
      assert dogs.is_best_dog == true
      assert dogs.name == "some name"
    end

    test "create_dogs/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pets.create_dogs(@invalid_attrs)
    end

    test "update_dogs/2 with valid data updates the dogs" do
      dogs = dogs_fixture()
      assert {:ok, %Dogs{} = dogs} = Pets.update_dogs(dogs, @update_attrs)
      assert dogs.age == 43
      assert dogs.birthdate == ~D[2011-05-18]
      assert dogs.is_best_dog == false
      assert dogs.name == "some updated name"
    end

    test "update_dogs/2 with invalid data returns error changeset" do
      dogs = dogs_fixture()
      assert {:error, %Ecto.Changeset{}} = Pets.update_dogs(dogs, @invalid_attrs)
      assert dogs == Pets.get_dogs!(dogs.id)
    end

    test "delete_dogs/1 deletes the dogs" do
      dogs = dogs_fixture()
      assert {:ok, %Dogs{}} = Pets.delete_dogs(dogs)
      assert_raise Ecto.NoResultsError, fn -> Pets.get_dogs!(dogs.id) end
    end

    test "change_dogs/1 returns a dogs changeset" do
      dogs = dogs_fixture()
      assert %Ecto.Changeset{} = Pets.change_dogs(dogs)
    end
  end
end
