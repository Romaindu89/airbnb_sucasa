class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :accommodation

  validates :nb_of_guests, presence: true
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true, comparison: { greater_than: :check_in_date}
end
