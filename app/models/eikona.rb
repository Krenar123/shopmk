# frozen_string_literal: true

class Eikona < ApplicationRecord
  belongs_to :proion
  has_one_attached :image
end
