class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true, foreign_key: true
      # t.references :author, null:false, foreign_key: { to_table: 'users' }
      t.string :title
      t.string :text
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end

  end
end
