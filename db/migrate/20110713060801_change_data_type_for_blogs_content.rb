class ChangeDataTypeForBlogsContent < ActiveRecord::Migration
  def self.up
      change_table :blogs do |t|
      t.change :content, :text
  end

  def self.down
      change_table :blogs do |t|
      t.change :content, :string
      end
  end
end
