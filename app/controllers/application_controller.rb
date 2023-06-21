class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

     # following syntax (with ||) will return current_user if it is already there
    # and will not hit the database with record each time the current_user method is called
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    #This code checks if the user that is logged in is the current user
    def logged_in?
        !! current_user
    end


    #This code restricts users that are not logged in from performing specific operations
    def require_user
        if !logged_in?
            flash[:error] = "You must be logged in to perform this operation!"
            redirect_to login_path
        end

    end

end
