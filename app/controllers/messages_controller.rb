class MessagesController < ApplicationController
before_filter :authenticate 
#before_filter :correct_following => [:create]

        def new
             @title = "New Message"
             @micropost = Message.new
             @message_items = current_user.mfeed.paginate(:page => params[:page])
        end

        def create 
            @micropost = current_user.messages.build(params[:message])
            search_users
              if !@micropost.content.empty? 
                @micropost.save
                flash[:success] = "Sent"
                redirect_to root_path
              else
                @message_items = [ ]
                render 'pages/home'
              end
           end
           
         def index 
            search_users
        end
          
          def search_users
              @user = User.where("name like ?", "%#{params[:q]}%")
              respond_to do |format|
                 format.html
                 format.json { render :json => @user.map(&:attributes)}
                end
            end
            
            private
            
            def correct_following
                @user = User.find(params[:id])
                @user.following?
            end
end
