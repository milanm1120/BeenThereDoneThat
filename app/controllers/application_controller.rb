class ApplicationController < ActionController::Base
    include ApplicationHelper

    def welcome         #root route
        # if !logged_in?
        #     redirect_to login_path
        # end
    end
end
