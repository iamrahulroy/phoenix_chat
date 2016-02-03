defmodule PhoenixChat.PageControllerTest do
  use PhoenixChat.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to ChatApp"
  end
end
