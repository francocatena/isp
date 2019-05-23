use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :isp, IspWeb.Endpoint,
  http: [port: 4001],
  server: false

# Gettext config
config :isp, IspWeb.Gettext, default_locale: "en"

# Bamboo test adapter
config :isp, Isp.Notifications.Mailer, adapter: Bamboo.TestAdapter

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :isp, Isp.Repo,
  username: if(System.get_env("TRAVIS"), do: "postgres", else: "isp"),
  password: if(System.get_env("TRAVIS"), do: "postgres", else: "isp"),
  database: "isp_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :argon2_elixir,
  t_cost: 1,
  m_cost: 5
