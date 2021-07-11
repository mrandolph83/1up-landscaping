class JobsController < ApplicationController

  def index
    @jobs = Job.all 
  end 
  
  def new
        @job = Job.new
        @job.build_employee
        @user = User.find_by_id(session[:user_id])

    end

    def create
      @job = Job.new(job_params)
      @job.user_id = session[:user_id]

      if @job.save 
        redirect_to job_path(@job)
      else 
        render :new
      end 
    end

    def show
        @job = Job.find_by_id(params[:id])
      
        redirect_to '/' if !@job
    end

    def edit
      @job = Job.find(params[:id])
     end
     

     def update
      @job = Job.find(params[:id])
      @job.update(job_params)
      redirect_to job_path(@job)
     end

     def destroy
      Job.find(params[:id]).destroy
      redirect_to jobs_path
    end 

    private

    def job_params
        params.require(:job).permit(:job_address_street, :picture, :description, :job_address_land, {:services => []}, :service_date, :employee_id, :user_id, employee_attributes: [:name], user_attributes: [:name])
    end 

end
