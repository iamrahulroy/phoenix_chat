defmodule PhoenixChat.PageController do
  use PhoenixChat.Web, :controller

  def index(conn, _params) do
    user = current_user(conn)
    render conn, "index.html", test: user
  end

  defp current_user(conn) do
    Plug.Conn.get_session(conn, :current_user)
  end
end
