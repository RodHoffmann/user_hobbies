require 'rails_helper'

RSpec.describe UserHobby, type: :model do
  it "is valid with valid attributes" do
    user_hobby = FactoryBot.build(:user_hobby)
    expect(user_hobby.user.name).to eq "Albert"
    expect(user_hobby.hobby.name).to eq "Segeln"
  end
end
