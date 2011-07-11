class AddFriendsToRelationships < ActiveRecord::Migration
  def self.up
    add_column :relationships, :friendship, :boolean
  end

  def self.down
    remove_column :relationships, :friendship
  end
end
