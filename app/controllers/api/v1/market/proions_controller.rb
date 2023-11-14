module Api
  module V1
    module Market
      class ProionsController < ApplicationController
        def create
          proions_params.each do |proion_params|
            proion = Proion.find_or_initialize_by(market_proion_id: proion_params[:market_proion_id])
            proion.update(proion_params)
          end

          head :ok
        end
  
        private
  
        def proions_params
          params.require(:proions).permit(proions: %i[market_proion_id title price])
            .fetch(:proions, [])
        end
      end
    end
  end
end