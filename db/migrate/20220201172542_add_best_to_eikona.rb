# frozen_string_literal: true

class AddBestToEikona < ActiveRecord::Migration[7.0]
  def change
    add_column :eikonas, :best, :string
  end
end
