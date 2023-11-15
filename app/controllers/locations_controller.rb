# frozen_string_literal: true

class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_current_user

  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)
    create_user_location
    
    render json: { location: @user_location, address: @location.address, locations: UserLocation.where(user: @current_user).count }
  end

  private

  def location_params
    params.permit!.except(:authenticity_token, :controller, :action)
  end

  def create_user_location
    @user_location = UserLocation.create(location: @location, user: @current_user, phone: location_params[:phone])
  end

  def get_current_user
    @current_user = current_user if current_user.present?
  end
end
