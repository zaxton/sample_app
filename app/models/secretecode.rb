# == Schema Information
# Schema version: 20110711061314
#
# Table name: secretecodes
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  text       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Secretecode < ActiveRecord::Base
    attr_accessible :text
    
    belongs_to :user
end
