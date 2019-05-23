defmodule Isp.Notifications do
  alias Isp.Accounts.User
  alias Isp.Notifications.{Mailer, Email}

  def send_password_reset(%User{} = user) do
    user
    |> Email.password_reset()
    |> Mailer.deliver_later()
  end
end
