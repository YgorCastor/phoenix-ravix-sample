defmodule PhoenixRavixExampleWeb.PageController do
  use PhoenixRavixExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
