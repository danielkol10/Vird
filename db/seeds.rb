require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  user = User.new(
    first_name: Faker::FamilyGuy.character,
    last_name: Faker::Beer.name,
    email: Faker::Internet.safe_email,
    password: "123456"
  )
  user.save!
end
