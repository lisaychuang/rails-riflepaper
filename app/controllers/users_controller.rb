class UsersController < ApplicationController
    before_action :authorize, only: [:show]

    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
          session[:user_id] = user.id
          redirect_to '/'
        else
          redirect_to '/signup'
        end
    end  

    def show 
        if !!current_user
            @user = User.find(params[:id])
        else 
            redirect_to root_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

