class LocationsController < ApplicationController
    before_action :authenticate_user!
    before_action :get_current_user

    def new
        @location = Location.new
    end

    def create
        @location = Location.create(location_params)
        create_user_location

        render json: { location: @location, full_address: @location.full_address, locations: Location.all.count }
    end

    private

    def location_params
        params.permit(:city, :neighborhood, :road, :description)
    end

    def create_user_location
        @user_location = UserLocation.create(location: @location, user: @current_user)
    end

    def get_current_user
        @current_user = current_user if current_user.present?
    end
end
