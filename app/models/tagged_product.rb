# frozen_string_literal: true

class TaggedProduct < ApplicationRecord
  belongs_to :tag
  belongs_to :proion
end
