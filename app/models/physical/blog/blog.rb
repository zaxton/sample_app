# == Schema Information
# Schema version: 20110710163255
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

module Physical
    module Blog
        class Blog < ActiveRecord::Base
            belongs_to :user
                :class_name => '::Physical::Blog::Blog'
        end
    end
end
