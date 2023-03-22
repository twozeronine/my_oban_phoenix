import Config

config :my_oban_phoenix, MyObanPhoenix.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "my_oban_phoenix_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :my_oban_phoenix, MyObanPhoenixWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "j9QgAVTjATRytp3QufWfUA90sh0ohT7VHebSRptmUQrhP75YaWocJINtde3r6RdH",
  server: false

config :logger, level: :warn
config :phoenix, :plug_init_mode, :runtime

config :my_oban_phoenix, Oban, testing: :inline
