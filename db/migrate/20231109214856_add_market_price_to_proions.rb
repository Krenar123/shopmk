class AddMarketPriceToProions < ActiveRecord::Migration[7.0]
  def change
    add_column :proions, :market_price, :string
  end
end
