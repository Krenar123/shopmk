# frozen_string_literal: true

class LineItemsController < ApplicationController
  def create
    # Find associated proion and current cart
    chosen_proion = Proion.find(params[:product_id])
    current_cart = @current_cart

    # If cart already has this proion then find the relevant line_item and iterate quantity otherwise create a new line_item for this proion
    if current_cart.proions.include?(chosen_proion)
      # Find the line_item with the chosen_proion
      @line_item = current_cart.line_items.find_by(proion_id: chosen_proion)
      # Iterate the line_item's quantity by one
      @line_item.quantity += 1
    else
      @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.proion = chosen_proion
      @line_item.quantity = 1
    end

    # Save and redirect to cart show path
    @line_item.save!
    render json: { html: render_to_string(partial: 'carts/cart_nav', locals: { cart: current_cart }) }
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end

  def add_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.quantity += 1
    @line_item.save

    render json: { html: render_to_string(partial: 'carts/proion', locals: { line_items: @current_cart.line_items }), amount: @current_cart.sub_total }
  end

  def reduce_quantity
    @line_item = LineItem.find(params[:id])
    if @line_item.quantity == 1
      @line_item.destroy
    else
      @line_item.quantity -= 1 if @line_item.quantity > 1
      @line_item.save
    end


    render json: { html: render_to_string(partial: 'carts/proion', locals: { line_items: @current_cart.line_items }), amount: @current_cart.sub_total }
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :product_id, :cart_id)
  end
end
