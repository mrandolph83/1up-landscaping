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
        @user_jobs = Job.user_jobs(params[:id])
        redirect_to '/' if !@user  
    end

    def user_jobs 
      @user = User.find_by_id(session[:user_id])
      @user_jobs = Job.user_jobs(session[:user_id])
      
      redirect_to '/' if !@user 
    end

    def edit
      @user = User.find(params[:id])
     end
     

     def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(@user)
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
