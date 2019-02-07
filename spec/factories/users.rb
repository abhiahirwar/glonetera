FactoryBot.define do
  factory :user do
    first_name {"Joe"}
    last_name {"Doe"}
    email { Faker::Internet.email}
    phone {"0222333444"}
    password {"password"}
  end
end