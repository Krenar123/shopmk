# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :reference
      t.references  :parent_category, foreign_key: { to_table: :categories }

      t.timestamps
    end
    add_index :categories, :name, unique: true
    add_index :categories, :reference, unique: true
  end
end
