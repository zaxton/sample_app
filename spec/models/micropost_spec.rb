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
 end
