class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    user_id = params[:user_id]
    @user = User.includes(:posts).find(user_id)
  end

  def show
    user_id = params[:user_id]
    post_id = params[:id]
    @user = User.find(user_id)
    @post = @user.posts.includes(:comments, :likes).find(post_id)
  end

  def new
    @post= Post.new
  end

  def create
    new_post = Post.new(post_params)

    respond_to do |format|
      format.html do
        if new_post.save
          redirect_to user_post_path(new_post.user_id, new_post.id), notice: 'Post created successfully'
        else
          render :new, alert: 'An error occured. Please try again!'
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(@post.author), notice: "Successfully deleted the post #{@post.title}."
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
