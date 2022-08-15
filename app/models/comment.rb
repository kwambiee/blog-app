class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: 'post_counter'
  belongs_to :post, class_name: 'Post', counter_cache: 'comments_counter'

  after_create :update_comment_counter

  def update_comment_counter
    post.update(comments_counter: post.comments.count)
  end
end
