class Delivery < ApplicationRecord
  belongs_to :rider
  belongs_to :order

  ################################# SETTINGS ###################################
  enum status: %i[accepted prepared delivered paid]
end
