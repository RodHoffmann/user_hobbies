require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = FactoryBot.build(:user, wohnort: "Berlin")
    user.hobbies << FactoryBot.build(:hobby, name: "Segeln")
    expect(user.name).to eq "Albert"
    expect(user.wohnort).to eq "Berlin"
    expect(user.hobbies[0].name).to eq "Segeln"
  end
end
