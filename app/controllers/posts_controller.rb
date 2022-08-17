class PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @user = User.find(user_id)
    @posts = @user.posts.order(created_at: :desc)
  end

  def show
    user_id = params[:user_id]
    id = params[:id]
    @user = User.find(user_id)
    @post = Post.find(id)
    @comments = @post.comments.order(created_at: :desc)
    @likes = @post.likes.all
  end
end
