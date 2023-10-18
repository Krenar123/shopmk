# frozen_string_literal: true

class Proion < ApplicationRecord
  attr_accessor :tag_names

  belongs_to :category, optional: true
  has_many :eikonas
  accepts_nested_attributes_for :eikonas, reject_if: :all_blank, allow_destroy: true
  has_many :tagged_products, dependent: :delete_all
  has_many :tags, through: :tagged_products

  def price_to_calculate
    price.present? ? price.to_i : 0
  end

  def main_image
    return false unless check_for_images

    eikonas.where(thumbnail: 'true').pluck(:path_ref).first
  end

  def check_for_images
    eikonas.present?
  end

  def save_and_link_tag(params)
    transaction do
      save!
      link_tags!(params[:tag_names])
    rescue ActiveRecord::ActiveRecordError
      return_value = false
      raise ActiveRecord::Rollback
    end
  end

  def update_and_link_tag(params)
    transaction do
      update!(params)
      link_tags!(params[:tag_names])
    rescue ActiveRecord::ActiveRecordError
      return_value = false
      raise ActiveRecord::Rollback
    end
  end

  private

  def link_tags!(tag_names)
    return TaggedProduct.where(proion_id: id).destroy_all if tag_names.blank?

    tags = Tag.where(name: tag_names.split(', '))
    tagged_products = TaggedProduct.where(tag_id: tags.map(&:id), proion_id: id)

    tag_names.split(', ').each_with_index do |name, _position|
      tag = Tag.find_by!(name: name)

      # if break doesnt work use if if
      if tag.present? && TaggedProduct.find_by(tag_id: tag.id, proion_id: id).blank?
        TaggedProduct.create(tag_id: tag.id, proion_id: id)
      end
    end
  end
end
