class Accommodation < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :title, presence: true

  validates :address, presence: true

  validates :price_per_night, presence: true, numericality: { greater_than: 0, message: "cannot be negative !" }

  validates :nb_of_guests, presence: true, numericality: { greater_than: 0, message: "cannot be negative !" }

  validate :validate_at_least_one_photo

  def validate_at_least_one_photo
    errors.add(:photos, ": You must upload at least 1 photo !") if photos.blank?
  end
end
