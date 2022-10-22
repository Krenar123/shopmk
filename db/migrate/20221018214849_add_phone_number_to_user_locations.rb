class AddPhoneNumberToUserLocations < ActiveRecord::Migration[7.0]
  def change
    add_column :user_locations, :phone, :string
  end
end
