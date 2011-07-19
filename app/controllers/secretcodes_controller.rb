class SecretcodesController < ApplicationController
    
    def new
        @title = "Confirm User"
        @code = Secretcode.new(params[:secretcodes])
    end
    
    def create
        @user = current_user
        @code = @user.secrectcodes.build(params[:secrectcodes])
        if @code.user_code == @user.gen_code
            @user.toggle!(:activated)
            flash[:success] = "Profile successfully activated. Welcome!"
            redirect_to current_user
        else
            redirect_to 'sessions/new'
            flash[:error] = "Could not activate account. Please try again."
        end
    end
end
