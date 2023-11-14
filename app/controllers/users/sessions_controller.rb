# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    # def create
    #   super
    # end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end

    def continue_as_guest
      ip_address = request.remote_ip
      user = User.find_or_create_guest(ip_address)
  
      sign_in(user)
      
      url_to_redirect = @current_cart.present? ? cart_checkout_path(locale: I18n.locale) : shop_path(locale: I18n.locale)
      
      redirect_to url_to_redirect
    end
  end
end
