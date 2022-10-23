# frozen_string_literal: true

class AddDeviseToRiders < ActiveRecord::Migration[7.0]
  def self.up
    change_column :riders, :email, :string, null: false, default: ""
    add_column :riders, :encrypted_password, :string, null: false, default: ""
    add_column :riders, :reset_password_token, :string
    add_column :riders, :reset_password_sent_at, :datetime
    add_column :riders, :remember_created_at, :datetime

    add_index :riders, :email,                unique: true
    add_index :riders, :reset_password_token, unique: true
    # add_index :riders, :confirmation_token,   unique: true
    # add_index :riders, :unlock_token,         unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
