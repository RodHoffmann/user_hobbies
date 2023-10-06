require 'rails_helper'

RSpec.describe Hobby, type: :model do
  it "is valid with valid attributes" do
    hobby = FactoryBot.build(:hobby)
    expect(hobby.name).to eq "Segeln"
  end
end
