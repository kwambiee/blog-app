class PostRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :like, :postid, foreign_key: true
  end
end
