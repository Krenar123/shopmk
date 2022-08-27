# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @cart = @current_cart

    render json: { html: render_to_string(partial: 'carts/cart', locals: { cart: @cart }) }
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end
end
