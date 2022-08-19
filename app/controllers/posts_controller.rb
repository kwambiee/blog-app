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

  def new
    @current = current_user
  end

  def create
    new_post = current_user.posts.build(post_params)

    respond_to do |format|
      format.html do
        if new_post.save
          redirect_to user_post_path(new_post.author_id, new_post.id), notice: 'Post was successfully created.'
        else
          render :new, alert: 'Post was not created.'
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
