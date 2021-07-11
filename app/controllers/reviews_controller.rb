class ReviewsController < ApplicationController

    def new 
        @job = Job.find_by_id(params[:job_id])
        @review = Review.new
    end 
    
    def create
        @review = Review.new(review_params)
    
        if @review.save 
            redirect_to review_path(@review)
        else 
            render :new 
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
    