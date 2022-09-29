# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!, only: :cart_checkout
  before_action :get_current_user, only: :cart_checkout
  
  def show
    @cart = @current_cart

    render json: { html: render_to_string(partial: 'carts/cart', locals: { cart: @cart }) }
  end

  def cart_checkout
    @show_location = @current_user.present? && @current_user.locations.blank? ? true : nil
    @cart = @current_cart
    @order = Order.new
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end

  private

  def get_current_user
    @current_user = current_user if current_user.present?
  end
end
