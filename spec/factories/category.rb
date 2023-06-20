# spec/factories/category.rb

FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    # Add other attributes as needed
  end
end
