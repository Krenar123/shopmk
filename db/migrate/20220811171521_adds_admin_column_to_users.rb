# frozen_string_literal: true

class AddsAdminColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :hrists, :admin, :boolean, default: false, null: false
  end
end
