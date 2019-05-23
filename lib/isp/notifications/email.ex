defmodule Isp.Notifications.Email do
  use Bamboo.Phoenix, view: IspWeb.EmailView

  import Bamboo.Email
  import IspWeb.Gettext

  alias Isp.Accounts.User

  def password_reset(%User{} = user) do
    subject = dgettext("emails", "Password reset")

    base_email()
    |> to(user.email)
    |> subject(subject)
    |> render(:password_reset, user: user)
  end

  defp base_email() do
    new_email()
    |> from({gettext("IspApp"), "support@isp-app.com"})
    |> put_layout({IspWeb.LayoutView, :email})
  end
end
