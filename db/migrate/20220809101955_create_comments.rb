class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :authorid
      t.integer :postid
      t.string :text

      t.timestamps
    end
    add_index :comments, :authorid
    add_index :comments, :postid
  end
end
