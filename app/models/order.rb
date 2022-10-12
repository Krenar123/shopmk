# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :deliveries
  has_many :line_items

  def address
    location = UserLocation.find_by(id: user_location_id)

    return nil unless location.present?

    Location.find_by(id: location.location_id).full_address
  end
end
