class SessionsController < ApplicationController

def welcome
end 

def destroy
    session.delete(:user_id)
    redirect_to '/'
end

def new
end

def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else 
        flash[:error] - "Sorry your login info was incorrect. Please try again."
        redirect_to login_path
    end 
end 

def omniauth  #log users in with omniauth

end


end