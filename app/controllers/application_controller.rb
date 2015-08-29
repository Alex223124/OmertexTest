class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  
  def user_not_authorized
    flash[:alert] = "Access denied."
    redirect_to (request.referrer || root_path)
  end

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :user_name << :first_name << :last_name << :client_income
   devise_parameter_sanitizer.for(:account_update) << :user_name << :first_name << :last_name << :client_income
  end

end