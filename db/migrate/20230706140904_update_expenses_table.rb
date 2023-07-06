class UpdateExpensesTable < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :acct_by, :decimal
    add_column :expenses, :acct_to, :decimal
  end
end
