class AddRoadToLocations < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :road, :string
  end
end
