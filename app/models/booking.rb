class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vacuum
  validates :rent_duration, presence: true
end
