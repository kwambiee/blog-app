class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      # t.belongs_to :user, index: true, foreign_key: true
      # t.belongs_to :post, index: true, foreign_key: true
      self.primary_key = 'id'
      t.references :author, null:false, foreign_key: { to_table: 'users' }
      t.references :post, null:false, foreign_key: { to_table: 'posts' }

      t.timestamps
    end
  end
end
