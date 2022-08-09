class AuthorRefToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comment, :authorid, foreign_key: true
  end
end
