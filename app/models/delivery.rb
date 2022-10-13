class Delivery < ApplicationRecord
  belongs_to :rider
  belongs_to :order

  ################################# SETTINGS ###################################
  enum status: %i[delivered paid]
end
