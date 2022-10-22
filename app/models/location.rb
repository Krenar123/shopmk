# frozen_string_literal: true

class Location < ApplicationRecord
  scope :by_created, -> { order(created_at: :asc) }
  scope :most_recently_created, -> { by_created.last }

  has_many :user_locations, dependent: :delete_all
  has_many :users, through: :user_locations

  attr_accessor :phone

  def full_address
    "#{neighborhood} #{road}"
  end
end
