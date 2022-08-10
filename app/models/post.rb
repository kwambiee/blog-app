class Post < ApplicationRecord
    has_many :likes
    has_many :comments

    belongs_to :user

    def update_post_counter
        user.increment!(:posts_counter)
    end

    def recent_comments
        comments.limit(5).order(created_at: :desc)
    end
end
