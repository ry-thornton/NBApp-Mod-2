class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    def current_user
        if session[:user_id]
           @current_user = User.find(session[:user_id]) 
        end
    end

    def logged_in?
        !!current_user
    end

    def logout
        session[:user_id] = nil
    end

    def authorize
        redirect_to new_session_path unless logged_in?
    end

end
