class LocationsController < ApplicationController
    before_action :authenticate_user!
    before_action :get_current_user

    def new
        @location = Location.new
    end

    def create
    end

    private

    def get_current_user
        @current_user = current_user if current_user.present?
    end
end
