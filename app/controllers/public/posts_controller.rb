class Public::PostsController < ApplicationController

  def index
    redirect_to new_post_path
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    validated_tags
    if !@post.errors.any?
      @post.save_tags(params[:post][:tag])
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(update_params)
    validated_tags
    if !@post.errors.any?
      @post.save_tags(params[:post][:tag])
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to users_mypage_path(current_user)
  end


  private

  def post_params
    params.require(:post).permit(:post_image, :name, :introduction, :parking, :season, :transportation, :latitude, :longitude)
  end

  def update_params
    params.require(:post).permit(:name, :introduction, :parking, :season, :transportation)
  end

  def validated_tags
    @post.errors.add(:base, "タグを入力してください") if params[:post][:tag].blank?
  end
end
