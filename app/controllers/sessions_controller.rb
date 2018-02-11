class SessionsController < ApplicationController

    def new
    end
  
    def create
        user = User.find_by_email(params[:email])
        # If user exists AND password is correct.
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to '/'
        else
        # Send user back to the login form
            redirect_to '/login'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/login'
    end

end
