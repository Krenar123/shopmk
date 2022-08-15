# frozen_string_literal: true

module AuthenticateAdmin
  extend ActiveSupport::Concern

  protected

  def authenticate_admin!
    authenticate_hrist!
    redirect_to :pages_index, status: :forbidden unless current_hrist.admin?
  end
end
