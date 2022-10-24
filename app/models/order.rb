# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :deliveries
  has_many :line_items

  after_create :create_delivery

  def address
    return nil unless user_location.present?

    user_location.location.full_address
  end
  
  def phone
    return nil unless user_location.present?

    user_location.phone
  end

  def rider
    deliveries.last.rider
  end

  def user_location
    return nil unless UserLocation.find_by(id: user_location_id).present?

    UserLocation.find_by(id: user_location_id)
  end

  def total_price
    self.line_items.map{ |l| l.total_price }.sum + 70
  end

  private

  def create_delivery
    Delivery.create(rider: Rider.where(name: "Albion Krosi").first, order: self)
  end
end
