class AddCategoryReferenceToExpenses < ActiveRecord::Migration[7.0]
  def change
    # Add the foreign key column to reference the categories table
    add_reference :expenses, :category, foreign_key: true

    # Update existing data in the category column to correspond to the id of the corresponding row in the categories table
    # Assuming the category names in the expenses table match the names in the categories table
    Expense.all.each do |expense|
      category = Category.find_or_create_by(name: expense.category)
      expense.update(category: category)
    end

    # Remove the old category column
    remove_column :expenses, :category
  end
end
