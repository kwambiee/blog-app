class UserPostsController < ApplicationController
    def index
        @user_posts=User.find(params[:id]).posts
    end

    def show
        @user_post=User.find(params[:id]).posts.find(params[:post_id])
    end
end