module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :user_name << :first_name << :last_name << :client_income
   devise_parameter_sanitizer.for(:account_update) << :user_name << :first_name << :last_name << :client_income
  end

end

DeviseController.send :include, DevisePermittedParameters

