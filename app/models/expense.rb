class Expense < ApplicationRecord
  belongs_to :user

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :acct_by, presence: true
  validates :acct_to, presence: true
  validates :transaction_types_id, presence: true
  validates :date, presence: true
  validates :description, presence: true
end
