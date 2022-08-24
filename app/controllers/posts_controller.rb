class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index; end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    new_post = current_user.posts.build(post_params)

    respond_to do |format|
      format.html do
        if new_post.save
          redirect_to user_post_path(new_post.author_id, new_post.id), notice: 'Post created successfully'
        else
          render :new, alert: 'An error occured. Please try again!'
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(current_user), notice: "Successfully deleted the post #{@post.title}."
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
