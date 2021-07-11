class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end 

    def show
        @employee = Employee.find_by_id(params[:id])
      
        redirect_to '/' if !@employee
    end 
    
# Add display alphabetical for index

end
