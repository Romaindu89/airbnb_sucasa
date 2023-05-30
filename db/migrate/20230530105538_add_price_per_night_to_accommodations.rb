class AddPricePerNightToAccommodations < ActiveRecord::Migration[7.0]
  def change
    add_column :accommodations, :price_per_night, :integer
  end
end
