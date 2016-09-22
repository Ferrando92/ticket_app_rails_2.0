class UserController < ApplicationController
  before_action :set_user, only: [:show]
  def list #ADMIN FUNCTION
    @users = User.all
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :mail, :password)
  end
end
