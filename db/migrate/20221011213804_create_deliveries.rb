class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.references :rider, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end

    rider = Rider.create!(name: 'Test Rider Name',
                          email: 'test@test.com',
                          mobile: 123_456_789)

    Delivery.update_all(rider_id: rider.id)
  end
end
