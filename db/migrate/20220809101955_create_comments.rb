class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :authorid
      t.integer :postid
      t.string :text

      t.timestamps
    end
    add_reference :comment, :authorid, foreign_key: true
    add_reference :comment, :postid, foreign_key: true
    add_index :comments, :authorid
    add_index :comments, :postid
  end
end
