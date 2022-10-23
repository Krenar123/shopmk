class RidersController < ApplicationController
    before_action :authenticate_rider!

    def show
        @rider = Rider.find(params[:id])
    end
end
