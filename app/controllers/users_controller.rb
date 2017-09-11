class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  private

    def user_params
      params.require(:user).permit(:name, :nick, :email, :phone, :password,
                                   :password_confirmation, :photo)
    end
end
