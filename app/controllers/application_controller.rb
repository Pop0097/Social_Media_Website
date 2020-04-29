class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  #global variables are used to help improve navigation of the site. They are only initialized in controllers
  $page_before_viewing_post #tracks the page that the user was on before calling posts/show.html.erb
  $page_before_viewing_user #tracks the apge that the user was on before calling users/show.html.erb
  $previous_user #tracks the user the current_user was just viewing 
  $previous_post #tracks the post the current_user was just viewing

  protected def configure_permitted_parameters
    #extends the parameters list on the devise controllers
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :sex, :birth_year, :birth_month, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :sex, :birth_year, :birth_month, :avatar])
  end

end
