# == Schema Information
# Schema version: 20110710164422
#
# Table name: relationships
#
#  id          :integer         primary key
#  follower_id :integer
#  followed_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  friendship  :boolean
#

class Relationship < ActiveRecord::Base
        attr_accessible :followed_id, :friendship 
        
        belongs_to :follower, :class_name => "User"
        belongs_to :followed, :class_name => "User"
        
        validates :followed_id, :presence => true
        validates :follower_id, :presence => true 
end
