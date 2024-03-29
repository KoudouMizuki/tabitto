class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @favorites = current_user.favorites
  end  

  def create
    @post_favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
    @post_favorite.save
    redirect_to request.referer
  end

  def destroy
    @post_favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    @post_favorite.destroy
    redirect_to request.referer
  end
end


