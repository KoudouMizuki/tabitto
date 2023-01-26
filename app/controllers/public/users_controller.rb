class Public::UsersController < ApplicationController

  #before_action :ensure_normal_user, only: %i[update destroy]

  def show
    @user = current_user
    @posts =@user.posts
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_mypage_path
    else
      render :edit
    end  
  end

  #def ensure_normal_user
    #if resource.email == 'guest@example.com'
      #redirect_to root_path, alert: 'ゲストユーザーの更新・削除できません。'
    #end
  #end

  private

  def user_params
    params.require(:user).permit(:user_image,:account_name, :user_name, :email, :password)
  end
end
