# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :slark,
  ecto_repos: [Slark.Repo]

# Configures the endpoint
config :slark, Slark.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "c8a88hCslxAlKukXsMkfXYYDbfLInhFlnNmT6XYDe1/EoaThQbe5BN7Q8dGKukjR",
  render_errors: [view: Slark.ErrorView, accepts: ~w(json)],
  pubsub: [name: Slark.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure Guardian
config :guardian, Guardian,
  issuer: "slark",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: Slark.GuardianSerializer
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
