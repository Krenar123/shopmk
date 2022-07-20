class AddMoreAdditionalFieldsToProions < ActiveRecord::Migration[7.0]
  def change
    add_column :proions, :previous_price, :string
    add_column :proions, :long_description, :text
    add_column :proions, :energy, :string
    add_column :proions, :fat, :string
    add_column :proions, :carbs, :string
    add_column :proions, :fibre, :string
    add_column :proions, :protein, :string
    add_column :proions, :salt, :string
    add_column :proions, :sugar, :string
  end
end
