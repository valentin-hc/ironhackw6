class ApplicationController < ActionController::Base
	before_filter :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:avatar, :username, :email, :password, :password_confirmation) } 
   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password, :remember_me) }
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :full_name, :description, :password, :current_password, :password_confirmation, :avatar) } 
 end
end
