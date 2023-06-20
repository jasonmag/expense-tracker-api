class Category < ApplicationRecord
  has_many :expenses
  has_many :budgets

  validates :name, presence: true, uniqueness: true
end
