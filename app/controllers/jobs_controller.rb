class JobsController < ApplicationController

    def new
        @job = Job.new
        @job.build_employee

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

    private

    def job_params
        params.require(:job).permit(:job_address_street, :picture, :description, :job_address_land, :services, :service_date, :employee_id, :user_id, employee_attributes: [:name])
    end 

end
