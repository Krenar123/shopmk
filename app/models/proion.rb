# frozen_string_literal: true

class Proion < ApplicationRecord
  has_many :eikonas
  has_many :tagged_products
  has_many :tags, through: :tagged_products

  def main_image
    return false unless check_for_images

    eikonas.where(best: 'true').pluck(:path_ref).first
  end

  def check_for_images
    eikonas.present?
  end
end
