class TransactionType < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :dr_cr, inclusion: { in: [true, false] }
end