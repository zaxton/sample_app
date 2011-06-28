module UsersHelper
  def gravatar_for(user, options = {:size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => user.name, 
                                            :class => 'gravatar',
                                            :gravatar => options)
  end
  
  def the_user
          @user = User.find(params[:id])
   end
end
