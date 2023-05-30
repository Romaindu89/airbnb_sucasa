class AddNbOfGuestsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :nb_of_guests, :integer
  end
end
