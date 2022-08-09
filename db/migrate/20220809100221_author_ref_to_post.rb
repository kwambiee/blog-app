class AuthorRefToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :post, :authorid, foreign_key: true
  end
end
