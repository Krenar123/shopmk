class CreateEikonas < ActiveRecord::Migration[7.0]
  def change
    create_table :eikonas do |t|
      t.string :path_ref
      t.references :proion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
