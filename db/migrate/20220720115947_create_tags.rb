class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :reference
      t.string :color
      
      t.timestamps
    end
    add_index :tags, :name, unique: true
  end
end
