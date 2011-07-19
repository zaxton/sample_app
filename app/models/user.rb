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

class User < ActiveRecord::Base 
  attr_accessor :password
  attr_accessible :username, :name, :email, :birthday, :password, :password_confirmation, :goal, 
                  :relationship_status, :about_me, :quotes, :work_info, :gen_code
  has_many :microposts, :dependent => :destroy
  has_many :blog, :dependent => :destroy
  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy 
  has_many :reverse_relationships, :foreign_key => "followed_id", :class_name => "Relationship",
                                   :dependent => :destroy 
  has_many :following, :through => :relationships, :source => :followed
  has_many :followers, :through => :reverse_relationships, :source => :follower
  has_many :messages, :dependent => :destroy
  has_many :secretcodes
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :username, :presence => true,
                       :uniqueness => true
                      
  validates :name, :presence => true, 
                   :length => { :maximum => 36 }
                  
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  
  # Automatically creates a password_confirmation
  
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..40 }
                       
  before_save :encrypt_password
  
  
  # Return true if the user's password matches the submitted password
  def has_password?(submitted_password)
    #Compare encrypted_password with the encrypted version of 
    # submitted_password.
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    user && user.has_password?(submitted_password) ? user : nil
  end
  
  def feed 
    Micropost.from_users_followed_by(self)
  end
  
  def mfeed
     Message.from_users_recip_id(self)
  end
  
  def following?(followed)
    relationships.find_by_followed_id(followed)
  end
  
  def follow!(followed)
     relationships.create!(:followed_id => followed.id)
  end
  
  def unfollow!(followed)
     relationships.find_by_followed_id(followed).destroy
  end
   
  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
  
  
  
  private
  
  def secure_code
       a = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a + ("!"..")").to_a
       a.shuffle[0..6].join
   end
  
  def encrypt_password 
    self.salt = make_salt if new_record? 
    self.encrypted_password = encrypt(password)
  end
  
  def encrypt(string) 
    secure_hash("#{salt}--#{string}")
  end
  
  def make_salt 
    secure_hash("#{Time.now.utc}--#{password}")
  end
  
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
