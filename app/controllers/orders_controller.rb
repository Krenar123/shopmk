# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save

    LineItem.where(cart_id: session[:cart_id]).update_all(cart_id: nil)
    
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil

    redirect_to order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:user_location_id, line_item_ids: [])
  end
end
