class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_query

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_url, :alert => exception.message
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

    private
    def set_query
        @query = User.ransack(params[:q])
    end

end
