class RegistrationsController < Devise::RegistrationsController

private

  def sign_up_parameters
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
  
  def account_update_parameters
    params.require(:user).permit(:name,:email,:password,:password_confirmation, :current_password)
  end

end