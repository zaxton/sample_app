class AddFriendsToRelationships < ActiveRecord::Migration
  def self.up
    add_column :relationships, :friendship, :boolean, :default => false
  end

  def self.down
    remove_column :relationships, :friendship
  end
end
