class AddMarketProionIdToProions < ActiveRecord::Migration[7.0]
  def change
    add_column :proions, :market_proion_id, :string
  end
end
