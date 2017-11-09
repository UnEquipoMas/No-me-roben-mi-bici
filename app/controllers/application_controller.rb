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
  
   protected
    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to new_user_session_path, :notice => 'Debe iniciar sesión para poder acceder a esta página'
        ## if you want render 404 page
        ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
      end
    end
end
