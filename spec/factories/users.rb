FactoryBot.define do
  factory :user do
    name { "Albert" }
    wohnort { "Berlin" }
    email { "albert@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
