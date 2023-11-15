class AddPricePerSizeToProions < ActiveRecord::Migration[7.0]
  def change
    add_column :proions, :price_per_size, :string
  end
end
