class PostRefToCommnet < ActiveRecord::Migration[7.0]
  def change
    add_reference :comment, :postid, foreign_key: true
  end
end
