class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :likes, foreign_key: 'post_id', class_name: 'Like'
  has_many :comments, foreign_key: 'post_id', class_name: 'Comment'

  belongs_to :author, class_name: 'User'

  after_create :update_post_counter

  def update_post_counter
    author.update(post_counter: author.posts.count)
  end

  def recent_comments
    comments.last(5)
  end
end
