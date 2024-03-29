class Public::HomesController < ApplicationController
  def top
    @posts_all = if params[:name]
      Post.joins(:tags).where('posts.name LIKE ? or tags.name LIKE ?', "%#{params[:name]}%", "%#{params[:name]}%").order(id: :DESC).distinct
    else
      []
    end
    @posts = Post.all.order(id: :DESC).limit(8)
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
