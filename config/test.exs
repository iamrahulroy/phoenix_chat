use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_chat, PhoenixChat.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :phoenix_chat, PhoenixChat.Repo,
  adapter: Sqlite.Ecto,
  database: "db/phoenix_chat_test.sqlite",
  pool: Ecto.Adapters.SQL.Sandbox

config :comeonin, bcrypt_log_rounds: 4
