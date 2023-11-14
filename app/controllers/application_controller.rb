# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_cart
  before_action :set_locale

  # For links generated with routing helpers (like products_path or products_url)
  def default_url_options
    { locale: (I18n.locale == I18n.default_locale ? nil : I18n.locale) }
  end

  private

  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(id: session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end

    if session[:cart_id].nil?
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
  end

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end
  
  def after_sign_in_path_for(resource_or_scope)
    current_cart.present? ? cart_path(current_cart, locale: I18n.locale) : shop_path(locale: I18n.locale)
  end
end
