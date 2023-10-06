FactoryBot.define do
  factory :user_hobby do
    user { FactoryBot.create(:user) }
    hobby { FactoryBot.create(:hobby) }
  end
end
