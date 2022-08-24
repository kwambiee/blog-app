class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(author_id: current_user.id, post_id: @post.id)

    respond_to do |format|
      format.html do
        if @like.save
          redirect_to user_post_path(@post.author.id, @post.id), notice: 'Liked 👍'
        else
          puts @like.errors.full_messages
          # redirect_to user_post_path(@post.author.id, @post.id), alert: 'An error occured, please try again!'
        end
      end
    end
  end
end
