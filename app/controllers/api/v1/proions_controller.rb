module Api
  module V1
    class ProionsController < ApplicationController
      skip_before_action :verify_authenticity_token
      
      def create
        proions_params.each do |proion_params|
          proion = Proion.find_or_initialize_by(market_proion_id: proion_params[:market_proion_id])
          proion.update(proion_params)
        end

        head :ok
      end

      def destroy
        Proion.where.not(market_proion_id: [nil, ""]).destroy_all
      end

      private

      def proions_params
        params.require(:proions).map { |proion| proion.permit(:market_proion_id, :title, :market_price) }
      end
    end
  end
end