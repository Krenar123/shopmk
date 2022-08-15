module AuthenticateAdmin
    extend ActiveSupport::Concern

    protected

    def authenticate_admin!
        authenticate_hrist!
        redirect_to :proions unless current_hrist.admin?
    end
end