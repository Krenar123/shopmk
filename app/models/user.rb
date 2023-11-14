# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_locations, dependent: :delete_all
  has_many :locations, through: :user_locations
  
  def self.find_or_create_guest(ip_address)
    find_or_create_by(ip_address: ip_address) do |user|
      # If the user doesn't exist, set additional attributes here
      # For example, you might want to set a default password.
      password_generator = SecureRandom.hex(10)

      user.email = "guest#{password_generator}@gmail.com"
      user.password = password_generator
      user.password_confirmation = password_generator
    end
  end
end
