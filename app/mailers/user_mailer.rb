class UserMailer < ActionMailer::Base
  default :from => "johnsonben.johnson283@gmail.com"
  
  def welcome_email(user)
    @user = user
    
    mail(:to => user.email,
          :subject => "Welcome to the sample app!")
  end
end
