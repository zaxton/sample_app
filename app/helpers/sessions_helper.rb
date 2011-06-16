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
end
