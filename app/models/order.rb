# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :deliveries
  has_many :line_items
end
