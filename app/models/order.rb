# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :deliveries
  has_many :line_items

  after_create :create_delivery

  def address
    location = UserLocation.find_by(id: user_location_id)

    return nil unless location.present?

    Location.find_by(id: location.location_id).full_address
  end

  def rider
    deliveries.rider
  end

  private

  def create_delivery
    Delivery.create(rider: Rider.all.first, order: self)
  end
end
