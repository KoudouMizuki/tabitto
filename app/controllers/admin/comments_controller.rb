class Admin::CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @comments = Comment.all
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path
  end  
end
