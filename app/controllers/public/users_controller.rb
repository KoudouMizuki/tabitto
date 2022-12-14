class Public::UsersController < ApplicationController

  #before_action :ensure_normal_user, only: %i[update destroy]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
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
