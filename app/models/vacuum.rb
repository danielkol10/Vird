class Vacuum < ApplicationRecord
  MODELS = %w(rx-9000 rx-7000 rx-8500 eagle annihilator decko\ 2000x)

  VACCUM_PHOTOS = {
    "rx-9000" => "https://res.cloudinary.com/druzius/image/upload/v1542696605/r2d2.png",
    "rx-7000" => "https://res.cloudinary.com/druzius/image/upload/v1542696601/henry.jpg",
    "rx-8500" => "https://res.cloudinary.com/druzius/image/upload/v1542696601/hetty.jpg",
    "eagle" => "https://res.cloudinary.com/druzius/image/upload/v1542696602/rosie-robot.jpg",
    "annihilator" => "https://res.cloudinary.com/druzius/image/upload/v1542698264/default_vird.jpg",
    "decko 2000x" => "https://res.cloudinary.com/druzius/image/upload/v1542696601/wall-e.jpg"
  }

  before_validation :set_image

  belongs_to :user
  # has_many :bookings
  # has_many :users, through: :bookings

  validates :model, inclusion: { in: MODELS }

  private

  def set_image
    self.image = VACCUM_PHOTOS[model]
  end
end
