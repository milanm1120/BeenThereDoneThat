class ApplicationController < ActionController::Base
    include ApplicationHelper
    

    def welcome         #root route
        # if !logged_in?
        #     redirect_to root_path
        # else
        #     redirect_to user_path(@user)
        # end
    end

end
