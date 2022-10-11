# frozen_string_literal: true

class UserLocation < ApplicationRecord
  scope :by_created, -> { order(created_at: :asc) }
  scope :most_recently_created, -> { by_created.last }

  belongs_to :user
  belongs_to :location
end
