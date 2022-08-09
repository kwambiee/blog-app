class AuthorRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :like, :authorid, foreign_key: true
  end
end
