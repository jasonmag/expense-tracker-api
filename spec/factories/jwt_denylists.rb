FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2023-07-02 20:24:18" }
  end
end
