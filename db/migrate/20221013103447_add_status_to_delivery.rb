class AddStatusToDelivery < ActiveRecord::Migration[7.0]
  def change
    add_column :deliveries, :status, :integer
  end
end
