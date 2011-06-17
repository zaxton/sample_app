# == Schema Information
# Schema version: 20110616043432
#
# Table name: sessions
#
#  id         :integer         not null, primary key
#  session_id :string(255)     not null
#  data       :text
#  created_at :datetime
#  updated_at :datetime
#

class Sessions < ActiveRecord::Base
end
