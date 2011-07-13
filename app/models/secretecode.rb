# == Schema Information
# Schema version: 20110713064945
#
# Table name: secretecodes
#
#  id         :integer         primary key
#  text       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Secretecode < ActiveRecord::Base
    attr_accessible :text
    
    belongs_to :user
end
