class Accommodation < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :bookings

  validates :title, presence: true

  validates :address, presence: true

  validates :price_per_night, presence: true, numericality: { greater_than_or_equal_to: 1 }

  validates :nb_of_guests, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
