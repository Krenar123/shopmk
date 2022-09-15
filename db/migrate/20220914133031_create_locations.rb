class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :country
      t.string :city
      t.string :neighborhood
      t.string :latitude
      t.string :longitude
      t.string :description

      t.timestamps
    end
  end
end
