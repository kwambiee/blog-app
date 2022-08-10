class Post < ApplicationRecord
  has_many :likes, foreign_key: 'post_id', class_name: 'Like'
  has_many :comments, foreign_key: 'post_id', class_name: 'Comment'

  belongs_to :author, class_name: 'User'

  def update_post_counter
    user.increment!(:post_counter)
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
