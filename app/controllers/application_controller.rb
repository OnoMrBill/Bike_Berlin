class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  logger.debug "inside ApplicationController..."

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password])
  	devise_parameter_sanitizer.permit(:sign_in) do |user_params|
    	user_params.permit(:first_name, :last_name, :email, :password)
    end
  end

	rescue_from CanCan::AccessDenied do |exception|
	  redirect_to main_app.root_url, alert: exception.message
	end  
end
