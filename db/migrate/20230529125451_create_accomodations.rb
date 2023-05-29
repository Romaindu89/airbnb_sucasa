class CreateAccomodations < ActiveRecord::Migration[7.0]
  def change
    create_table :accomodations do |t|
      t.string :title
      t.string :description
      t.string :address
      t.integer :nb_of_guests
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
