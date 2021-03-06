# frozen_string_literal: true

class CreateProions < ActiveRecord::Migration[7.0]
  def change
    create_table :proions do |t|
      t.string :title
      t.string :description
      t.string :price

      t.timestamps
    end
  end
end
