class Api::V1::PostsController < ApplicationController
  #   skip_before_action :verify_authenticity_token
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    respond_to do |format|
      format.json { render json: @posts }
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    respond_to do |format|
      format.json { render json: @post }
    end
  end
end
