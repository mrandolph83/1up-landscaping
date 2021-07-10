class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save 
        session[:user_id] = @user.id 
        @user.image.purge 
        @user.image.attach(params[:user][:image])
        redirect_to user_path(@user)
      else 
        render :new
      end 
    end

    def show
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
        
    end

    def destroy
      User.find(params[:id]).destroy
      redirect_to '/'
    end 

    private

    def user_params
        params.require(:user).permit(:email, :password, :name, :address_street, :address_land)
    end 

end
