require "faker"

Booking.destroy_all
Vacuum.destroy_all
User.destroy_all


10.times do
  user = User.new(
    first_name: Faker::FamilyGuy.character,
    last_name: Faker::Beer.name,
    email: Faker::Internet.safe_email,
    password: "123456"
  )
  user.save!
end

vacuum = Vacuum.create!(
  user: User.all.sample,
  model: "rx-9000",
  price: 30,
  address: "tel-aviv",
  image: "https://res.cloudinary.com/druzius/image/upload/v1542696605/r2d2.png"
)

vacuum = Vacuum.create!(
  user: User.all.sample,
  model: "rx-7000",
  price: 22,
  address: "tel-aviv",
  image: "https://res.cloudinary.com/druzius/image/upload/v1542696601/henry.jpg"
)

vacuum = Vacuum.create!(
  user: User.all.sample,
  model: "rx-8500",
  price: 28,
  address: "tel-aviv",
  image: "https://res.cloudinary.com/druzius/image/upload/v1542696601/hetty.jpg"
)

vacuum = Vacuum.create!(
  user: User.all.sample,
  model: "eagle",
  price: 11,
  address: "tel-aviv",
  image: "https://res.cloudinary.com/druzius/image/upload/v1542696602/rosie-robot.jpg"
)

vacuum = Vacuum.create!(
  user: User.all.sample,
  model: "annihilator",
  price: 160,
  address: "tel-aviv",
  image: "https://res.cloudinary.com/druzius/image/upload/v1542698264/default_vird.jpg"
)

vacuum = Vacuum.create!(
  user: User.all.sample,
  model: "decko 2000x",
  price: 15,
  address: "tel-aviv",
  image: "https://res.cloudinary.com/druzius/image/upload/v1542696601/wall-e.jpg"
)

