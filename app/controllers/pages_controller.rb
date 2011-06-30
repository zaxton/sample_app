class PagesController < ApplicationController
  
  # Define title variables for HTML pages
  
  def home
   @title = "Home"
   @user_create = User.new
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
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
