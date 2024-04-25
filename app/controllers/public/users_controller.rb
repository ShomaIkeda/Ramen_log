class Public::UsersController < ApplicationController
  
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to mypage_path, notice: '会員情報の更新が完了しました。'
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end
  
  def mypage
    @user = current_user
    
  end


  
private

  def user_params
    params.require(:user).permit(:nickname, :is_active )
  end

end
