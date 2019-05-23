defmodule Isp.Accounts.MigrationTest do
  use Isp.DataCase

  alias Isp.Accounts
  alias Isp.Accounts.Migration

  describe "accounts" do
    test "account_prefixes/0 returns all account prefixes" do
      account = fixture(:seed_account)

      assert Migration.account_prefixes() == [Accounts.prefix(account)]
    end
  end
end
