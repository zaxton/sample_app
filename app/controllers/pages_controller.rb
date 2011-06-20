class PagesController < ApplicationController
  
  # Define title variables for HTML pages
  
  def home
    @user = User.new
    @title = "Home"
  end
  
  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end

end
