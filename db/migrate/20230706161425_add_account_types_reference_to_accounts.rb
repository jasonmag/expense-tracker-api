class AddAccountTypesReferenceToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_reference :accounts, :account_types, foreign_key: true
  end
end
