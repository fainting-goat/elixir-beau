defmodule Elixirbeau.Repo.Migrations.CreateDog do
  use Ecto.Migration

  def change do
    create table(:dog) do
      add :name, :string
      add :age, :integer
      add :birthdate, :date
      add :is_best_dog, :boolean, default: false, null: false

      timestamps()
    end

  end
end
