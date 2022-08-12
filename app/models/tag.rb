# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :tagged_products, dependent: :delete_all
  has_many :products, through: :tagged_products
end
