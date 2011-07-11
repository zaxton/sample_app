class CreateSecretecodes < ActiveRecord::Migration
  def self.up
    create_table :secretecodes do |t|
      t.integer :user_id, :null => false
      t.string :text

      t.timestamps
    end
  end

  def self.down
    drop_table :secretecodes
  end
end
