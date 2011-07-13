class AddMessageTokensToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :message_tokens, :integer
  end

  def self.down
    remove_column :messages, :message_tokens
  end
end
