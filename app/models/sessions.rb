# == Schema Information
# Schema version: 20110710163255
#
# Table name: sessions
#
#  id         :integer         not null, primary key
#  session_id :string(255)     not null
#  data       :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Sessions < ActiveRecord::Base
end
