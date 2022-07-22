# frozen_string_literal: true

class Proion < ApplicationRecord
  attr_accessor :tag_names

  has_many :eikonas
  has_many :tagged_products, dependent: :delete_all
  has_many :tags, through: :tagged_products

  def main_image
    return false unless check_for_images

    eikonas.where(best: 'true').pluck(:path_ref).first
  end

  def check_for_images
    eikonas.present?
  end

  def save_and_link_tag(tag_names)
    transaction do
      save!
      link_tags!(tag_names)
    rescue ActiveRecord::ActiveRecordError
      return_value = false
      raise ActiveRecord::Rollback
    end
  end

  private

  def link_tags!(tag_names)
    return TaggedProduct.where(proion_id: id).destroy_all if tag_names.blank?
      
    tags = Tag.where(name: tag_names.split(", "))
    tagged_products = TaggedProduct.where(tag_id: tags.map(&:id), proion_id: id)

    tag_names.split(", ").each_with_index do |name, position|
      tag = Tag.find_by!(name: name)

      # if break doesnt work use if if 
      if tag.present?
        if TaggedProduct.find_by(tag_id: tag.id, proion_id: id).blank?
          TaggedProduct.create(tag_id: tag.id, proion_id: id)
        end
      end
    end

    TaggedProduct.where.not(id: tagged_products.map(&:id)).destroy_all
  end
end
