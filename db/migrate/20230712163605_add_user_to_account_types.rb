class AddUserToAccountTypes < ActiveRecord::Migration[7.0]
  def change
    add_reference :account_types, :user, foreign_key: true
  end
end
