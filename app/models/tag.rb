# frozen_string_literal: true

class Tag < ApplicationRecord
  ################################ ASSOCIATIONS ################################
  has_many :tagged_products, dependent: :delete_all
  has_many :products, through: :tagged_products

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
