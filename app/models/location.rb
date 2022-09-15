class Location < ApplicationRecord
    has_many :user_locations, dependent: :delete_all
    has_many :users, through: :user_locations
end
