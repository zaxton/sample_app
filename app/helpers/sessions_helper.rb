module SessionsHelper
  
  # Sign in User based on user id. Note => user comes from app/model/users 
  def sign_in(user)
    session[:remember_token] = user.id
    self.current_user = user
  end
  
  # Current_user derived from user 
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= session[:remember_token] && User.find(session[:remember_token])
  end
  
  # Sign in if current user is not blank 
  def signed_in?
    !current_user.nil?
  end
  
  # Sign user out when id and current_user status go blank  
  def sign_out
    session[:remember_token] = nil
    @current_user = nil
  end
  
  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page"
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page"
  end
  
  private
  
  def store_location
    session[:return_to] = request.fullpath
  end
  
  def clear_return_to
    session[:return_to] = nil
  end 
    
end
