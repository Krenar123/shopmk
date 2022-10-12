class Delivery < ApplicationRecord
  belongs_to :rider
  belongs_to :order
end
