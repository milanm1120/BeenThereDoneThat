module ApplicationHelper

    def current_user        #memozation
        @current_user ||= User.find_by(id: session[:user_id])
    end

end



