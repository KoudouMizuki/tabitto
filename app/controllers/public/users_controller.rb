class Public::UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  #before_action :ensure_normal_user, only: %i[update destroy]

  def show
    @posts = @user.posts
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_mypage_path(@user)
    else
      render :edit
    end
  end

  #def ensure_normal_user
  #  if resource.email == 'guest@example.com'
  #    redirect_to root_path, alert: 'ゲストユーザーの更新・削除できません。'
  #  end
  #end

  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_image,:account_name, :user_name, :email, :password)
  end
end
