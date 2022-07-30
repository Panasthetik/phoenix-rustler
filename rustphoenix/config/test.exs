import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rustphoenix, RustphoenixWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "zOZG5YLuTkHa3W7uETa5F1uOHEwFSSR5BJJYpu+kpm9YfZYHnq9JqTzMge0z3nh+",
  server: false

# In test we don't send emails.
config :rustphoenix, Rustphoenix.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
