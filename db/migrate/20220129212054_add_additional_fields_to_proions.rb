class AddAdditionalFieldsToProions < ActiveRecord::Migration[7.0]
  def change
    add_column :proions, :size, :string
    add_column :proions, :category, :string
  end
end
