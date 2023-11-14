# frozen_string_literal: true

class Category < ApplicationRecord
  ################################ ASSOCIATIONS ################################
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_category_id', dependent: :destroy
  belongs_to :parent_category, class_name: 'Category', optional: true
  has_many :proions
  has_one_attached :image

  ################################## SETTINGS ##################################

  ################################### SCOPES ###################################

  ################################## DELEGATES #################################

  ################################# VALIDATIONS ################################

  ################################## CALLBACKS #################################
  before_create :fill_reference

  private

  def fill_reference
    self.reference = SecureRandom.base36(24)
  end
end
