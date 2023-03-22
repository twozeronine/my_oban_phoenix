defmodule MyObanPhoenixWeb.PageController do
  use MyObanPhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
