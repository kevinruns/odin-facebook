class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :first_name, :family_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :first_name, :family_name, :current_password]) 
  end

end
