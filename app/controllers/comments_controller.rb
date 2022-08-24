class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(text: comment_parameters[:text], author_id: current_user.id, post_id: @post.id)

    respond_to do |format|
      format.html do
        if @comment.save
          redirect_to user_post_path(@post.author.id, @post.id), notice: 'Comment created successfully'
        else
          redirect_to user_post_path(@post.author.id, @post.id), alert: 'An error occured, please try again!'
        end
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(@comment.post.author.id, @comment.post.id),
                notice: "Successfully deleted the comment #{@comment.text}."
  end

  private

  def comment_parameters
    params.require(:comment).permit(:text)
  end
end
