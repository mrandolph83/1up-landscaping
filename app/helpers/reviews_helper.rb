module ReviewsHelper

    def find_job_by_rating(rating)
        job = Job.find_by_id(rating.job_id)
        byebug
        job.description
    end 
    end
