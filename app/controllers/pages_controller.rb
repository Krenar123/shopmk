# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :get_current_user, only: :shop
  before_action :get_location, only: :shop
  before_action :get_categories, only: :shop

  def index; end

  def shop
    @show_location = @current_user.present? && @current_user.locations.blank? ? true : nil
    @categories = Category.where(parent_category_id: nil).where.not(name: 'Home')
  end

  private

  def get_categories
    @main_category = Category.find_or_create_by(name: 'Home', icon: 'fa-solid fa-home')

    category = params[:reference].present? ? params[:reference] : @main_category.reference
    @category = Category.find_by(reference: category)
  end

  def get_current_user
    @current_user = current_user if current_user.present?
  end

  def get_location
    @location = @current_user.present? && @current_user.locations.present? ? @current_user.locations.most_recently_created : Location.new
  end
end
