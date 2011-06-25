class PagesController < ApplicationController
  
  # Define title variables for HTML pages
  
  def home
    @feed_items = current_user.feed.paginate(:page => params[:page])
    @micropost = Micropost.new if signed_in?ß
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
