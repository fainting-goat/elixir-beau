defmodule Elixirbeau.Pets.Dogs do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dog" do
    field :age, :integer
    field :birthdate, :date
    field :is_best_dog, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(dogs, attrs) do
    dogs
    |> cast(attrs, [:name, :age, :birthdate, :is_best_dog])
    |> validate_required([:name, :age, :birthdate, :is_best_dog])
  end
end
