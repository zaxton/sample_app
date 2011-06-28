# == Schema Information
# Schema version: 20110626014605
#
# Table name: blogs
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Blog < ActiveRecord::Base
attr_accessible :title, :content
belongs_to :user

validates :title, :presence => true, :confirmation => true

validates :content, :presence => true, :length => { :maximum => 1000 }

validates :user_id, :presence => true

default_scope :order => 'blogs.created_at DESC'

end
