class UserMailer < ActionMailer::Base
  default :from => "notifications@example.com"
  
  def welcome_email(user)
    @user = user
    @url = "http://example.com/login"
    mail(:to => User.email,
          :subject => "Welcome to the sample app!")
  end
end
