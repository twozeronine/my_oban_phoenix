import Config

config :my_oban_phoenix,
  ecto_repos: [MyObanPhoenix.Repo]

config :my_oban_phoenix, MyObanPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: MyObanPhoenixWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: MyObanPhoenix.PubSub,
  live_view: [signing_salt: "8vKh0oCx"]

config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

config :my_oban_phoenix, Oban,
  repo: MyObanPhoenix.Repo,
  plugins: [Oban.Plugins.Pruner],
  queues: [default: 10]

import_config "#{config_env()}.exs"
