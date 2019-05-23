defmodule IspWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use IspWeb, :controller
      use IspWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def controller do
    quote do
      alias IspWeb.Router.Helpers, as: Routes
      use Phoenix.Controller, namespace: IspWeb
      import Plug.Conn
      import IspWeb.Gettext
      import IspWeb.BreadcrumbPlug, only: [put_breadcrumb: 2, put_breadcrumb: 3]
      import IspWeb.SessionPlug, only: [authenticate: 2]
    end
  end

  def view do
    quote do
      alias IspWeb.Router.Helpers, as: Routes

      use Phoenix.View,
        root: "lib/isp_web/templates",
        namespace: IspWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import IspWeb.ErrorHelpers
      import IspWeb.InputHelpers
      import IspWeb.LinkHelpers
      import IspWeb.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
      import IspWeb.BreadcrumbPlug, only: [put_breadcrumb: 2]
      import IspWeb.SessionPlug, only: [fetch_current_session: 2]
      import IspWeb.CacheControlPlug, only: [put_cache_control_headers: 2]
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import IspWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
