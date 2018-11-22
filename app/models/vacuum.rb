class Vacuum < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
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
  has_many :bookings, dependent: :destroy
  # has_many :users, through: :bookings

  validates :model, inclusion: { in: MODELS }

  # include PgSearch
  # pg_search_scope :search_by_model_and_address,
  #   against: [ :model, :address ],
  #   using: {
  #     tsearch: { prefix: true }
  #   }

  include PgSearch
  pg_search_scope :global_search,
    against: [ :model, :address ],
    associated_against: {
      user: [:first_name, :last_name]
    },
    using: {
      tsearch: { prefix: true }
    }

  private

  def set_image
    self.image = VACCUM_PHOTOS[model]
  end
end
