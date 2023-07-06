class CreateTransactionTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_types do |t|
      t.string :name
      t.boolean :dr_cr

      t.timestamps
    end
  end
end
