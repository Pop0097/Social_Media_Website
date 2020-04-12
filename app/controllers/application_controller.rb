class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected def configure_permitted_parameters
    #extends the perameters list on the devise controllers
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :sex, :birth_year, :birth_month, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :sex, :birth_year, :birth_month, :avatar])
  end

end
