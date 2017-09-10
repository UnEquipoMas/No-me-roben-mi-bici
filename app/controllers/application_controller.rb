class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def hello
    render html: "¡Hola, mundo!"
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
  end
  
end
