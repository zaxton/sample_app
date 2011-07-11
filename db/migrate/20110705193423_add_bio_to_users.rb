class AddBioToUsers < ActiveRecord::Migration
  def self.up
      add_column :users, :goal, :string
      add_column :users, :relationship_status, :string
      add_column :users, :about_me, :string
      add_column :users, :quotes, :string
      add_column :users, :work_info, :string
  end

  def self.down
      remove_column :users, :goal
      remove_column :users, :relationship_status
      remove_column :users, :about_me
      remove_column :users, :quotes
      remove_column :users, :work_info
  end
end
