# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixirbeau,
  ecto_repos: [Elixirbeau.Repo]

# Configures the endpoint
config :elixirbeau, ElixirbeauWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kNtTk3J1pQnElcNnrX+8+Oj7wmml0cg9nzp6Tzs7YO5xz1rGsYqKxhBPXiN4eEJx",
  render_errors: [view: ElixirbeauWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Elixirbeau.PubSub,
  live_view: [signing_salt: "leEcTkYy"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
