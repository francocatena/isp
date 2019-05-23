defmodule IspWeb.SessionViewTest do
  use IspWeb.ConnCase, async: true

  import Phoenix.View

  alias IspWeb.SessionView

  setup %{conn: conn} do
    conn =
      conn
      |> bypass_through(IspWeb.Router, :browser)
      |> get("/")

    {:ok, %{conn: conn}}
  end

  test "renders new.html", %{conn: conn} do
    content = render_to_string(SessionView, "new.html", conn: conn)

    assert String.contains?(content, "Login")
  end
end
