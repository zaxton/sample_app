class ChangeDataTypeForMessagesMessageTokens < ActiveRecord::Migration
      def self.up
          change_table :messages do |t|
              t.change :message_tokens, :text
          end
      end

      def self.down
          change_table :messages do |t|
              t.change :message_tokens, :integer
          end
      end
    end
    