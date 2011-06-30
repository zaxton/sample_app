 require 'spec_helper'
 
 describe Micropost do
 	
 	before(:each) do
 		@user= Factory(:user)
 		@attr= { :content => "Value of content" }
 	end
 	
 	it "should create a new instance given valid attr" do
 		@user.microposts.create!(@attr)
 	end
 	
 describe "user associations" do
 	
 	before(:each) do
 		@Micropost = @user.microposts.create(@attr)
 	end
 	
 	it "should have a user attribute" do
 		@Micropost.should respond_to(:user)
 	end
 	
 	it "should have the right accociated user" do
 		@Micropost.user_id == @user.id
 		@Micropost.user == @user
 	end
   end
   
  describe "microposts validations" do
   
	it "should have a user id" do
		Micropost.new(@attr).should_not be_valid
	end
	
	it "should require nonblank content" do
		@user.microposts.build(:content => " ").should_not be_valid
	end
	
	it "should reject long content" do
		@user.microposts.build(:content => "a" * 141).should_not be_valid
	end
  end
  
  describe "from_users_followed_by" do
      
      before(:each) do
          @other_user = Factory(:user, :email => Factory.next(:email))
          @third_user = Factory(:user, :email => Factory.next(:email))
          
          @user_post = @user.microposts.create!(:content => "foo" )
          @other_post = @other_user.microposts.create!(:content => "bar" )
          @third_post = @third_user.microposts.create!(:content => "baz")
          
          @user.follow!(@other_user)
      end
      
      it "should have a from_users_followed_by class method" do
          Micropost.should respond_to(:from_users_followed_by)
      end
      
      it "should contain other_user posts" do
          Micropost.from_users_followed_by(@user).should include(@other_post)
      end
      
      it "should include the users own posts" do
          Micropost.from_users_followed_by(@user).should include(@user_post)
      end
      
      it "should not contain third_user posts" do
          Micropost.from_users_followed_by(@user).should_not include(@third_post)
      end
  end
      
      
 end
