# == Schema Information
# Schema version: 20110717043718
#
# Table name: secretcodes
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  user_code  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Secretcode < ActiveRecord::Base
    attr_accessible :user_code
    
    belongs_to :users
end
