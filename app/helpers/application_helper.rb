module ApplicationHelper


   
    
    def current_user
        current_user ||= User.find_by(id: session[:user_id])
    end 

    def is_admin?
        current_user && current_user.admin
    end 
    
    def is_logged_in?
        !!current_user
    end
    
    def authenticate_user!
        redirect_to new_session_path if !is_logged_in?
    end 
    

end
