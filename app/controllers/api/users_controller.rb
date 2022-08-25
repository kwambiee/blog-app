class Api::UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        @users = User.all
        respond_to do |format|
            format.json { render json: @users }
        end
    end

    def show
        @user = User.find(params[:id])
        respond_to do |format|
            format.json { render json: @user }
        end
    end
end