defmodule PhoenixChat.LayoutView do
  use PhoenixChat.Web, :view

  def current_user(conn) do
    Plug.Conn.get_session(conn, :current_user)
  end
end
