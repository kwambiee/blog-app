class Api::CommentsController < ApplicationController
    before_action :authenticate_user!
    def index
        @user=User.find(params[:user_id])
        @posts = @user.posts.find(params[:post_id])
        @comments = @posts.comments
        respond_to do |format|
            format.json { render json: @comments }
        end
    end

    def create
        @user=User.find(params[:user_id])
        @post = @user.posts.find(params[:post_id])
        @comment = @post.comments.create(text: comment_parameters[:text], author_id: current_user.id, post_id: @post.id)

        if @comment.save
            respond_to do |format|
                format.json { render json: @comment, status: :created }
            end
        else
            respond_to do |format|
                format.json { render json: @comment.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    def comment_parameters
        params.require(:comment).permit(:text)
    end
end