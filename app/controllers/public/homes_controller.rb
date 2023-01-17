class Public::HomesController < ApplicationController
  def top
    @posts = Post.order(id: :DESC).limit(8)
  end

  def about
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path
  end
end
