class Employee < ApplicationRecord
    has_many  :jobs
    has_many :users, through: :jobs
    has_many :reviews, through: :jobs
    has_one_attached :image
    
def top_employee
#  Employee rating average, then maximum of that. Displays their picture
end  

def employee_availability
    # Checks if employee is available, and does random generator to pick new employee
end 

def self.alphabetical
    order(name: :asc)
end 



end