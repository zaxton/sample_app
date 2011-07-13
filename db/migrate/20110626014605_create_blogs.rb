class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.text :content
      t.integer :user_id
      t.string :title

      t.timestamps
    end
    add_index :blogs, :user_id
    add_index :blogs, :created_at
  end

  def self.down
    drop_table :blogs
  end
end
