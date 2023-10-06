require 'rails_helper'

RSpec.describe FindSimilarUsers, type: :model do
  it "User mit ähnlichen Interessen im gleichen Wohnort vorhanden (über 70% match)" do
    Hobby.destroy_all
    User.destroy_all
    hobby1 = FactoryBot.build(:hobby, name: "Segeln")
    hobby1.save(validate: false)
    hobby2 = FactoryBot.build(:hobby, name: "Klettern")
    hobby2.save(validate: false)
    hobby3 = FactoryBot.build(:hobby, name: "Kochen")
    hobby3.save(validate: false)
    hobby4 = FactoryBot.build(:hobby, name: "Lesen")
    hobby4.save(validate: false)
    hobby5 = FactoryBot.build(:hobby, name: "Malen")
    hobby5.save(validate: false)
    hobby6 = FactoryBot.build(:hobby, name: "Fotografieren")
    hobby6.save(validate: false)
    hobby7 = FactoryBot.build(:hobby, name: "Fußball")
    hobby7.save(validate: false)
    hobby8 = FactoryBot.build(:hobby, name: "Tennis")
    hobby8.save(validate: false)
    active_user = FactoryBot.build(:user, wohnort: "Berlin", name: "Albert", email: "albert2@example.com", password: "password", password_confirmation: "password")
    active_user.hobbies.push(hobby1, hobby2, hobby3, hobby4)
    active_user.save(validate: false)
    # User mit 3 gleichen Hobbies im gleichen Wohnort (75% match)
    passive_user1 = FactoryBot.build(:user, wohnort: "Berlin", name: "Berta", email: "berta2@example.com", password: "password", password_confirmation: "password")
    passive_user1.hobbies.push(hobby1, hobby2, hobby3, hobby5)
    passive_user1.save(validate: false)
    # User mit 2 gleichen Hobbies im anderen Wohnort (75% match)
    passive_user2 = FactoryBot.build(:user, wohnort: "Heidelberg", name: "Hans", email: "hans2@example.com", password: "password", password_confirmation: "password")
    passive_user2.hobbies.push(hobby1, hobby2, hobby3, hobby5)
    passive_user2.save(validate: false)
    # User mit 0 gleichen Hobbies im gleichen Wohnort (25% match)
    passive_user3 = FactoryBot.build(:user, wohnort: "Berlin", name: "Dora", email: "Dora2@example.com", password: "password", password_confirmation: "password")
    passive_user3.hobbies.push(hobby4, hobby6, hobby7, hobby8)
    passive_user3.save(validate: false)
    expect(FindSimilarUsers.new(active_user).find.name).to eq "Berta"

  end

  it "Kein User mit gleichen Interessen im gleichen Wohnort vorhanden (aber in einem anderen Wohnort)" do
    Hobby.destroy_all
    User.destroy_all
    hobby1 = FactoryBot.build(:hobby, name: "Segeln")
    hobby1.save(validate: false)
    hobby2 = FactoryBot.build(:hobby, name: "Klettern")
    hobby2.save(validate: false)
    hobby3 = FactoryBot.build(:hobby, name: "Kochen")
    hobby3.save(validate: false)
    hobby4 = FactoryBot.build(:hobby, name: "Lesen")
    hobby4.save(validate: false)
    hobby5 = FactoryBot.build(:hobby, name: "Malen")
    hobby5.save(validate: false)
    hobby6 = FactoryBot.build(:hobby, name: "Fotografieren")
    hobby6.save(validate: false)
    hobby7 = FactoryBot.build(:hobby, name: "Fußball")
    hobby7.save(validate: false)
    hobby8 = FactoryBot.build(:hobby, name: "Tennis")
    hobby8.save(validate: false)
    active_user = FactoryBot.build(:user, wohnort: "Berlin", name: "Albert", email: "albert2@example.com", password: "password", password_confirmation: "password")
    active_user.hobbies.push(hobby1, hobby2, hobby3, hobby4)
    active_user.save(validate: false)
    # User mit 2 gleichen Hobbies im gleichen Wohnort (50% match)
    passive_user1 = FactoryBot.build(:user, wohnort: "Berlin", name: "Berta", email: "berta2@example.com", password: "password", password_confirmation: "password")
    passive_user1.hobbies.push(hobby3, hobby4, hobby5, hobby6)
    passive_user1.save(validate: false)
    # User mit 3 gleichen Hobbies im anderen Wohnort (75% match)
    passive_user2 = FactoryBot.build(:user, wohnort: "Heidelberg", name: "Hans", email: "hans2@example.com", password: "password", password_confirmation: "password")
    passive_user2.hobbies.push(hobby1, hobby2, hobby3, hobby5)
    passive_user2.save(validate: false)
    # User mit 0 gleichen Hobbies im gleichen Wohnort (0% match)
    passive_user3 = FactoryBot.build(:user, wohnort: "Berlin", name: "Dora", email: "Dora2@example.com", password: "password", password_confirmation: "password")
    passive_user3.hobbies.push(hobby5, hobby6, hobby7, hobby8)
    passive_user3.save(validate: false)

    expect(FindSimilarUsers.new(active_user).find.name).to eq "Hans"

  end

  it "Kein User User mit gleichen Interessen im gesamten System zu finden" do
    Hobby.destroy_all
    User.destroy_all
    hobby1 = FactoryBot.build(:hobby, name: "Segeln")
    hobby1.save(validate: false)
    hobby2 = FactoryBot.build(:hobby, name: "Klettern")
    hobby2.save(validate: false)
    hobby3 = FactoryBot.build(:hobby, name: "Kochen")
    hobby3.save(validate: false)
    hobby4 = FactoryBot.build(:hobby, name: "Lesen")
    hobby4.save(validate: false)
    hobby5 = FactoryBot.build(:hobby, name: "Malen")
    hobby5.save(validate: false)
    hobby6 = FactoryBot.build(:hobby, name: "Fotografieren")
    hobby6.save(validate: false)
    hobby7 = FactoryBot.build(:hobby, name: "Fußball")
    hobby7.save(validate: false)
    hobby8 = FactoryBot.build(:hobby, name: "Tennis")
    hobby8.save(validate: false)
    active_user = FactoryBot.build(:user, wohnort: "Berlin", name: "Albert", email: "albert2@example.com", password: "password", password_confirmation: "password")
    active_user.hobbies.push(hobby1, hobby2, hobby3, hobby4)
    active_user.save(validate: false)
    # User mit 2 gleichen Hobbies im gleichen Wohnort (50% match)
    passive_user1 = FactoryBot.build(:user, wohnort: "Berlin", name: "Berta", email: "berta2@example.com", password: "password", password_confirmation: "password")
    passive_user1.hobbies.push(hobby3, hobby4, hobby5, hobby6)
    passive_user1.save(validate: false)
    # User mit 1 gleichen Hobbies im anderen Wohnort (25% match)
    passive_user2 = FactoryBot.build(:user, wohnort: "Heidelberg", name: "Hans", email: "hans2@example.com", password: "password", password_confirmation: "password")
    passive_user2.hobbies.push(hobby4, hobby5, hobby6, hobby7)
    passive_user2.save(validate: false)
    # User mit 0 gleichen Hobbies im gleichen Wohnort (0% match)
    passive_user3 = FactoryBot.build(:user, wohnort: "Berlin", name: "Dora", email: "Dora2@example.com", password: "password", password_confirmation: "password")
    passive_user3.hobbies.push(hobby5, hobby6, hobby7, hobby8)
    passive_user3.save(validate: false)

    expect(FindSimilarUsers.new(active_user).find).to eq nil
  end
end
