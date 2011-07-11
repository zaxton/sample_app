class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :content
      t.integer :user_id
      t.integer :recip_id

      t.timestamps
    end
    add_index :messages, :recip_id
    add_index :messages, :content
  end

  def self.down
    drop_table :messages
  end
end
