# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_current_user, only: :cart_checkout

  def index
    @user_location = UserLocation.find_by(user: @current_user)
    @orders = Order.where(user_location_id: @user_location.id)
    @rider = Rider.all.last
  end

  def show
    @order = Order.find(params[:id])
    @rider = Rider.all.last
    @delivery = Delivery.find_by(order: @order, rider: @rider)
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

  def get_current_user
    @current_user = current_user if current_user.present?
  end

  def order_params
    params.require(:order).permit(:user_location_id, line_item_ids: [])
  end
end
