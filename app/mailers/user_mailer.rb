class UserMailer < ActionMailer::Base
  default :from => "johnsonben.johnson283@gmail.com"
  
  def welcome_email(user)
    @user = user
    
    mail(:to => user.email,
          :subject => "Welcome to the sample app!")
  end
  
  def following_notification_email(user)
      @user = user
      @other_other = Relationship.find(params[:id]).followed
      
      mail(:to => user.email,
           :subject => "#{@other_user.username} is now following you!")
       end
end
