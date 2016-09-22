class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end

  def authenticate_admin
      redirect_to root_path, :flash => { :error => 'NOT AN ADMIN, NOT COOL'} unless user_signed_in? && current_user.is_admin? 
  end
end
