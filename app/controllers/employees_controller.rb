class EmployeesController < ApplicationController

    
    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
  
        if @employee.save 
          redirect_to employee_path(@employee)
        else 
          render :new
        end 
      end
      
    def index
        @employees = Employee.all
        @employee = @employees.sample
    end 

    def show
        @employee = Employee.find_by_id(params[:id])
        @employees = Employee.all 
        redirect_to '/' if !@employee
    end 

    def edit
        @employee = Employee.find(params[:id])
       end
       
  
       def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)
        redirect_to employee_path(@employee)
       end
  
      private
  
    
# Add display alphabetical for index
def employee_params
    params.require(:employee).permit(:name,:bio, :headshot)
end 
end
