defmodule ElixirbeauWeb.PageController do
  use ElixirbeauWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
