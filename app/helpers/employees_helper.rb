module EmployeesHelper

    def average_rating(employee)
        total_reviews = []
        num_of_reviews = employee.reviews.count

        employee.reviews.each do |r|
        total_reviews << r.rating
    end 
        review_average = total_reviews.sum(0.0)/num_of_reviews
        review_average.round(1)
    end
end
