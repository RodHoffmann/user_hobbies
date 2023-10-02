# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying all Hobbys..."
Hobby.destroy_all
puts "Done!"
puts "Destroying all Users..."
User.destroy_all
puts "Done!"
puts "Creating Hobbies..."
Hobby::HOBBY_NAMEN.each do |hobby_name|
  Hobby.create(name: hobby_name)
end
puts "Done!"
puts "Creating Users..."
User1 = User.create(name: "Rodrigo", wohnort: "Berlin", email: "rodrigo@example.com", password: "123456")
dash = Dashboard.new
User1.dashboard = dash
10.times do
  User.create(name: Faker::Name.name, wohnort: Faker::Address.city,
              email: Faker::Internet.email, password: "123456")
end
puts "Done!"
puts "Creating Hobbies..."
Hobby::HOBBY_NAMEN.each do |hobby_name|
  Hobby.create(name: hobby_name)
end
puts "Done!"
puts "Adding Hobbies to Users..."
User.all.each do |user|
  Hobby.all.sample(6).each do |hobby|
    user.hobbys << hobby
  end
end
puts "Done!"
