# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :get_categories, only: :shop

  def index; end

  def shop
    @categories = Category.where(parent_category_id: nil).where.not(name: 'Home')
  end

  private

  def get_categories
    @main_category = Category.find_by(name: 'Home')

    category = params[:reference].present? ? params[:reference] : @main_category.reference
    @category = Category.find_by(reference: category)
  end
end
