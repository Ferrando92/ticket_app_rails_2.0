class UserController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_admin, only:[:list]
  def list #ADMIN FUNCTION
    @users = User.all
  end

  def show
  end
  def give_super_powers
    make_admin
  end

  private
  def make_admin
    @user = current_user
    @user.admin_role = true
    @user.save
    redirect_to root_path
  end
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :mail, :password)
  end
end
