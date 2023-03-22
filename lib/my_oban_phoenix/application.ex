defmodule MyObanPhoenix.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MyObanPhoenix.Repo,
      {Oban, Application.fetch_env!(:my_oban_phoenix, Oban)},
      MyObanPhoenixWeb.Telemetry,
      {Phoenix.PubSub, name: MyObanPhoenix.PubSub},
      MyObanPhoenixWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: MyObanPhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    MyObanPhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
