class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_user, only: [:show, :edit, :update]

  def index
    @users = User.page(params[:page])
  end

  def show
    @reviews = @user.reviews.page(params[:page])
  end

  def edit
  end

  def update
    @user.update(user_params) ? (redirect_to admin_user_path(@user)) : (render :edit)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :is_active)
  end

  def ensure_user
    @user = User.find(params[:id])
  end
  
end
