class Api::PostsController < ApplicationController
    before_action :authenticate_user!
    def index
        @user=User.find(params[:user_id])
        @posts = @user.posts
        respond_to do |format|
            format.json { render json: @posts }
        end
    end
    def show
        @user=User.find(params[:user_id])
        @post = @user.posts.find(params[:id])
        respond_to do |format|
            format.json { render json: @post }
        end
    end
end