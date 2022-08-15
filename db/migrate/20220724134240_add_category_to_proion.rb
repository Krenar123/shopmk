# frozen_string_literal: true

class AddCategoryToProion < ActiveRecord::Migration[7.0]
  def change
    remove_column :proions, :category, :string
    add_reference :proions, :category, null: true
  end
end
