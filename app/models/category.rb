# frozen_string_literal: true

class Category < ApplicationRecord
  ################################ ASSOCIATIONS ################################
  has_many :proions

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
