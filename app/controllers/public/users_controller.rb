class Public::UsersController < ApplicationController

  before_action :authenticate_user!,except: [:show, :index]

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.page(params[:page])
   
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
     if current_user # カレントユーザーが存在する場合のみ処理を行う
      current_user.update(is_active: false) # カレントユーザーのis_activeを更新
      reset_session
      redirect_to root_path, notice: "退会処理が完了しました。"
     else
      redirect_to root_path, alert: "ログインしていません。"
     end
  end

  def mypage
    @user = current_user
   

  end

  



private

  def user_params
    params.require(:user).permit(:nickname, :is_active )
  end

end
