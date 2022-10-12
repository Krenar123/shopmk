# frozen_string_literal: true

class ChangeMobileColumnTypeInRiders < ActiveRecord::Migration[7.0]
  def up
    change_column :riders, :mobile, :string
  end

  def down
    change_column :riders, :mobile, :integer
  end
end
