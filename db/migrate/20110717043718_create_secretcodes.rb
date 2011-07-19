class CreateSecretcodes < ActiveRecord::Migration
  def self.up
    create_table :secretcodes do |t|
      t.integer :user_id
      t.string :user_code

      t.timestamps
    end
  end

  def self.down
    drop_table :secretcodes
  end
end
