import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :phoenix_ravix_example, PhoenixRavixExample.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "phoenix_ravix_example_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :phoenix_ravix_example, PhoenixRavixExample.RavenStore,
  urls: [System.get_env("RAVENDB_URL", "http://localhost:8080")],
  database: "test",
  retry_on_failure: true,
  retry_on_stale: true,
  retry_backoff: 500,
  retry_count: 3,
  force_create_database: true,
  document_conventions: %{
    max_number_of_requests_per_session: 30,
    max_ids_to_catch: 32,
    timeout: 30,
    use_optimistic_concurrency: false,
    max_length_of_query_using_get_url: 1024 + 512,
    identity_parts_separator: "/",
    disable_topology_update: false
  }

config :phoenix_ravix_example, PhoenixRavixExample.RavenRepo,
  store: PhoenixRavixExample.RavenStore

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_ravix_example, PhoenixRavixExampleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "yyrxu9/8MPGHArJOYh3kF1n0Au538dg0B/6YN/f7J26vCEQ+f3M5GPwXF4orVwbx",
  server: false

# In test we don't send emails.
config :phoenix_ravix_example, PhoenixRavixExample.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
