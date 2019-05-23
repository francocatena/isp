defmodule Isp.Accounts.Migration do
  alias Isp.Repo
  alias Isp.Accounts
  alias Isp.Accounts.Account

  @doc """
  Returns a `List` of all account prefixes.

  ## Examples

      iex> account_prefixes()
      ["t_one", ...]

  """
  def account_prefixes do
    Account
    |> Repo.all()
    |> Enum.map(&Accounts.prefix(&1))
  end
end
