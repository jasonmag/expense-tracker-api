class Account < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :account_types_id, presence: true
  validates :description, presence: true
end
