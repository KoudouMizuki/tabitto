class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
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
    if @post.update(update_params)
      @post.save_tags(params[:post][:tag])
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
  end


  private

  def post_params
    params.require(:post).permit(:post_image, :name, :introduction, :parking, :season, :transportation, :latitude, :longitude)
  end

  def update_params
    params.require(:post).permit(:name, :introduction, :parking, :season, :transportation)
  end
end
