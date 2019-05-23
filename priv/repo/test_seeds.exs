# Reset
account = Isp.Repo.get_by(Isp.Accounts.Account, db_prefix: "test_account")

if account, do: {:ok, _} = Isp.Accounts.delete_account(account)

# Create

{:ok, _} =
  Isp.Accounts.create_account(%{
    name: "Test account",
    db_prefix: "test_account"
  })
