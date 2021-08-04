defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Supplies.{ExpirationEmail, GetByExpiration}
  alias Inmana.Mailer

  def send do
    data = GetByExpiration.call()

    data
    |> Task.async_stream(fn {to_email, supplies} -> send_emaail(to_email, supplies) end)
    |> Stream.run()
  end

  defp send_emaail(to_email, supplies) do
    to_email
    |> ExpirationEmail.create(supplies)
    |> Mailer.deliver_later!()
  end
end
