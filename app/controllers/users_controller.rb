class UsersController < ApplicationController
  
  before_filter :authenticate, :except => [:show, :new, :create, :index, :user_email]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => [:destroy] 
  
  def index
    @title = "All Users"
    @users = User.search(params[:search])
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.last
    @blog = @user.blog.first
    @title = @user.name
   end
  
  
  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save 
      # Handle a successful save
      @user.secretcodes.build(:text => secure_code)
      UserMailer.welcome_email(@user).deliver
      flash[:success] = "A verification email has been sent. Please check email provided to continue"
      redirect_to 'home'
    else
      @title = "Sign Up"
      @user.password = nil
      @user.password_confirmation = nil
      render 'new'
    end
  end
  
  def destroy
    user= User.find(params[:id])
    	if current_user?(user)
    		flash[:error] = "What kind of admin are you?"
    	else
    	    user.destroy
    		flash[:success] = "User Deleted"
    	end
    redirect_to users_path
  end
  
  def edit 
    @title = "Edit User Info"
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile Updated!"
      redirect_to @user
    else
      @title = "Edit User Info"
      render 'edit'
    end
  end
  
  def following 
      @title = "Following"
      @user = User.find(params[:id])
      @users = @user.following.all
      render 'show_follow'
  end
  
  def followers
      @title = "Followers"
      @user = User.find(params[:id])
      @users = @user.followers.all
      render 'show_follow'
  end
  
  def user_email
       @title = "Confirm Email"
       @code = User.secrectcodes.find(params[:id])
  end
  
  
  private
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
  
  def admin_user
    @user= User.find(params[:id])          
    redirect_to(root_path) if !current_user.admin? || current_user?(@user)
  end 
  
end
