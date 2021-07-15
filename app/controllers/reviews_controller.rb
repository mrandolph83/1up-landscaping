class ReviewsController < ApplicationController

    def new 
        @review = Review.new
        @job = Job.find_by_id(params[:job_id])
        
        
       
    end 
    
    def create
        @review = Review.new(review_params)
        @job = Job.find_by_id(review_params[:job_id])
        
        if @review.save 
            redirect_to review_path(@review)
        else 
            flash[:error] = "Ratings must be between 1 and 5"
            redirect_to new_job_review_path(@job)
        end 
    end
    
    def show
        @review = Review.find_by_id(params[:id])
    
    end 

    def edit
        @review = Review.find_by_id(params[:id])
       end
       
  
       def update
        @review = Review.find(params[:id])
        @review.update(review_params)
        redirect_to review_path(@review)
       end
    
    def index
        if params[:job_id]
            @job = Job.find_by_id(params[:job_id])
            @reviews = @job.reviews
        else
            @reviews = Review.all
        end 
    end 

    def destroy
        Review.find(params[:id]).destroy
        redirect_to '/'
      end 
    
    private
    
    def review_params
        params.require(:review).permit(:job_id, :rating, :description)  
    end 
    
    end
    