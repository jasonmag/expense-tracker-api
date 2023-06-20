# spec/factories/budget.rb

FactoryBot.define do
  factory :budget do
    amount { Faker::Number.decimal(l_digits: 2) }
    category
    user
    # Add other attributes as needed
  end
end
