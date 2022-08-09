class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :authorid
      t.integer :postid

      t.timestamps
    end
    add_reference :likes, :authorid, foreign_key: true
    add_reference :likes, :postid, foreign_key: true
    add_index :likes, :authorid
    add_index :likes, :postid
  end
end
