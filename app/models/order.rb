# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :deliveries
end
