class RemoveCategoryReferenceFromExpenses < ActiveRecord::Migration[7.0]
  def change
    remove_reference :expenses, :category, foreign_key: true
  end
end
