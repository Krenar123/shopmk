# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :proion
  belongs_to :cart
  belongs_to :order

  # LOGIC
  def total_price
    quantity * proion.price_to_calculate
  end
end
