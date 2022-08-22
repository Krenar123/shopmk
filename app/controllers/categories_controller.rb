class CategoriesController < ApplicationController
    def navigate_category
        @category = Category.find_by_reference(params[:reference])

        render json: { html: render_to_string(partial: 'category', locals: { category:  @category}) }
    end
end
