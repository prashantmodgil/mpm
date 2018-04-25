class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:invitation_id,:token])
  end

     def after_sign_up_path_for(accounts)
        accounts_path
     end

     def after_inactive_sign_up_path_for(accounts)
       accounts_path
     end
end
