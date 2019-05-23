defmodule Isp.Helpers do
  alias Isp.Accounts

  def prefixed(query, account) do
    query
    |> Ecto.Queryable.to_query()
    |> Map.put(:prefix, Accounts.prefix(account))
  end
end
