class Public::UsersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to mypage_path, notice: '会員情報の更新が完了しました。'
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def set_current_customer
    @customer = current_customer
  end
  
  
  
   private

  def user_params
    params.require(:user).permit(:nickname, :is_active )
  end
end
