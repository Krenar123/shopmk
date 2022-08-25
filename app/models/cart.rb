# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :proions, through: :line_items

  # LOGIC
  def sub_total
    line_items.map { |line_item| line_item.total_price }.sum
  end
end
