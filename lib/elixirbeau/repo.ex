defmodule Elixirbeau.Repo do
  use Ecto.Repo,
    otp_app: :elixirbeau,
    adapter: Ecto.Adapters.Postgres
end
