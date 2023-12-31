class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  has_many :expenses
  has_many :incomes
  has_many :budgets
  has_many :account_types
  has_many :accounts

  validates :email, presence: true, uniqueness: true
end
