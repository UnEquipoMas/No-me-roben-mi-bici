#config.time_zone = 'Bogota'
Time.zone = "Bogota"
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :configure_permitted_parameters, if: :devise_controller?
  #def configure_permitted_parameters
  #  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
  #user_params.permit(:name,:email, :password, :password_confirmation, :preferred)
  # end
  # devise_parameter_sanitizer.permit(:account_update) do |user_params|
  #   user_params.permit(:name,:email, :password, :password_confirmation, :preferred, :current_password)
  # end
  #end

  #def configure_permitted_parameters
   # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
  #end
  
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys:[:name, :email, :password, :current_password, :avatar])
    end
  
end
