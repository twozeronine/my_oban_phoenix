defmodule MyObanPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :my_oban_phoenix,
    adapter: Ecto.Adapters.Postgres
end
