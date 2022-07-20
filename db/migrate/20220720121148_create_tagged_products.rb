class CreateTaggedProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :tagged_products do |t|
      t.references :proion, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
