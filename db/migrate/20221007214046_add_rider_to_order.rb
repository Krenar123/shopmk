# frozen_string_literal: true

class AddRiderToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :rider_id, :integer
    add_index :orders, :rider_id

    rider = Rider.create!(name: 'Test Rider Name',
                          email: 'test@test.com',
                          mobile: 123_456_789)

    Order.update_all(rider_id: rider.id)
  end
end
