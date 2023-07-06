class AddUserReferenceToTransactionTypes < ActiveRecord::Migration[7.0]
  def change
    add_reference :transaction_types, :user, foreign_key: true
  end
end
