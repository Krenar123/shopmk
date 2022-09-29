class AddLocationToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :user_location
  end
end
