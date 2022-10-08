class AddRiderToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :rider, null: false, foreign_key: true


    rider = Rider.create!(name: 'Test Rider Name',
                          email: 'test@test.com',
                          mobile: 123_456_789)

    Order.update_all(rider_id: rider.id)

    # Order.find_each do |order|
    #   rider = Rider.create!(name: 'Test Rider Name',
    #                         email: 'test@test.com',
    #                         mobile: 123_456_789)
    #   order.update_column(rider_id: rider.id)
    # end


    # Rider.create!(name: 'Test Rider Name',
    #               email: 'test@test.com',
    #               mobile: 123_456_789)

    # execute <<-SQL.squish
    # UPDATE orders
    #   SET rider_id = (SELECT id
    #                   FROM riders
    #                   WHERE id = 1)
    # SQL
  end
end
