class CategoriesController < ApplicationController
    def show
        @category = Category.find_by_reference(params[:id])

        respond_to do |format|
            format.html { render @category }
            format.js { render layout: false }
        end
    end
end
