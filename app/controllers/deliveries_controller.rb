class DeliveriesController < ApplicationController
    def update
        @delivery = Delivery.find_by(id: params[:id])

        if @delivery.update(delivery_params)
            render json: { delivery: @delivery.to_json }
        else
            render json: { error: "true" }
        end
    end

    private

    def delivery_params
        params.require(:delivery).permit(:status)
    end
end
