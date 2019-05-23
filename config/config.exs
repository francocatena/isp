# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :isp,
  ecto_repos: [Isp.Repo]

# Configures the endpoint
config :isp, IspWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "U+7+X4TQLb0U6D1YdQqFG+Lavs7p7CJwVCQj+MB2uClSbuxgw4XQtmkCiyYBFmLw",
  render_errors: [view: IspWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Isp.PubSub, adapter: Phoenix.PubSub.PG2]

# Gettext config
config :isp, IspWeb.Gettext, default_locale: "es_AR"

# Ecto timestamps
config :isp, Isp.Repo, migration_timestamps: [type: :utc_datetime]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix and Ecto
config :phoenix, :json_library, Jason

# PaperTrail config
config :paper_trail, repo: Isp.Repo

# Scrivener HTML config
config :scrivener_html,
  routes_helper: IspWeb.Router.Helpers,
  view_style: :bulma

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
