require 'spec_helper'

describe "FriendlyForwardings" do
  
  it "should forward to the request page after signup" do
  user = Factory(:user)
  visit edit_user_path(user)
  # The test automatically follows the redirect to the sign up page
  fill_in :email, :with => user.email
  fill_in :password, :with => user.password 
  click_button
  # This test follows the redirect again, only this time to edit/update
  request.should render_template('user/edit')
  end
end 
    
