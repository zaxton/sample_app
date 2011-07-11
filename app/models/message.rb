# == Schema Information
# Schema version: 20110708012808
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  recip_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Message < ActiveRecord::Base
    attr_accessible :recip_id, :content, :message_tokens
    attr_reader :message_tokens
    belongs_to :user
    
    validates :user_id, :presence => true
    validates :content, :length => { :maximum => 140 }
    
    default_scope :order => 'messages.created_at DESC'
    
    scope :from_users_recip_id, lambda {|user| recip_id(user)}
    
    def message_tokens=(ids)
         self.user_ids = ids.split(",")
     end
   
    private
    
    def self.recip_id(user)
         where("recip_id = :user_id", {:user_id => user})
    end
end
