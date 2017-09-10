class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :nick, :email, :phone, :photo, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name,:photo, :email, :password, :password_confirmation, :current_password)
  end
end
