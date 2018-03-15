class SessionsController < ApplicationController
    def welcome
        render 'welcome'
    end

    def new
    end
  
    def create
        user = User.find_by_email(params[:email])
        # If user exists AND password is correct.
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to '/'
        elsif !user
            @fb_user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.name = auth['info']['name']
                u.email = auth['info']['email']
                u.image = auth['info']['image']
                u.password = auth['uid']
            end
            session[:user_id] = @fb_user.id
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
    
    private
    
    def auth
    request.env['omniauth.auth']
    end
end
