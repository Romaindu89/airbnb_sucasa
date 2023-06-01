class Accommodation < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :bookings

  validates :title, presence: true

  validates :address, presence: true

  validates :price_per_night, presence: true
  validates :price_per_night, length: { minimum: 1 }

  validates :nb_of_guests, presence: true
  validates :nb_of_guests, length: { minimum: 1 }
end
