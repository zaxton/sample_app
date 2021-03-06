# == Schema Information
# Schema version: 20110717171053
#
# Table name: users
#
#  id                  :integer         primary key
#  name                :string(255)
#  email               :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  encrypted_password  :string(255)
#  salt                :string(255)
#  admin               :boolean
#  goal                :string(255)
#  relationship_status :string(255)
#  about_me            :string(255)
#  quotes              :string(255)
#  work_info           :string(255)
#  username            :string(255)
#  birthday            :datetime
#  gen_code            :string(255)
#  activated           :boolean
#

module Physical
    module User
        class User < ActiveRecord::Base
            has_many :blog
        end
    end
end
