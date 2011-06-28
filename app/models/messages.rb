# == Schema Information
# Schema version: 20110623153030
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  message_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Messages < ActiveRecord::Base
end
