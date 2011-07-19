class AddActivationToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :gen_code, :string
  end

  def self.down
    remove_column :users, :gen_code
  end
end
