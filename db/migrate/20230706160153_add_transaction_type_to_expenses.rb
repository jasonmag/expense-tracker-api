class AddTransactionTypeToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_reference :expenses, :transaction_types, foreign_key: true
  end
end
