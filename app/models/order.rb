# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :line_items
  belongs_to :rider, optional: true
end
