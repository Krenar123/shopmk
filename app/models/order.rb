# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :rider, optional: true
end
