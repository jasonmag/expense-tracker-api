class Budget < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :amount, presence: true, numericality: { greater_than: 0 }
end
