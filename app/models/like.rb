class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: 'post_counter'
  belongs_to :post, class_name: 'Post', counter_cache: 'likes_counter'

  after_create :update_like_counter

  def update_like_counter
    post.update(likes_counter: post.likes.count)
  end
end
