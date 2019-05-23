defmodule IspWeb.BreadcrumbPlugTest do
  use IspWeb.ConnCase, async: true

  alias IspWeb.BreadcrumbPlug

  describe "breadcrumb" do
    test "add breadcrumb", %{conn: conn} do
      conn = BreadcrumbPlug.put_breadcrumb(conn, name: "Test", url: "/test")

      assert conn.assigns.breadcrumbs == [%{name: "Test", url: "/test", active: nil}]
    end

    test "add breadcrumb by name and url", %{conn: conn} do
      conn = BreadcrumbPlug.put_breadcrumb(conn, "Test", "/test")

      assert conn.assigns.breadcrumbs == [%{name: "Test", url: "/test", active: true}]
    end
  end
end
