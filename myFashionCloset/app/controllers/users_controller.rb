class UsersController < ApplicationController

    before_action :authenticate_user!

    def personalInfo
        @user = current_user
    end

    def personalInfoEdit
        @user = current_user
        @user.avatar.purge if @user.avatar.attached?
        @user.avatar.attach(user_params[:avatar])

    
        if @user.update(username: user_params[:username])
            flash[:success] = "Profile updated"
            redirect_to root_path
        else
            flash[:error] = "Something gone wrong"  #Da gestire meglio
            redirect_to root_path
        end
    end

    private

    def user_params
      params.require(:user).permit(:username, :avatar)
    end
end
