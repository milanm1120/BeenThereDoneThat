class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new                     #render a signup form
        @user = User.new
    end

    def show
        
    end

    def create                  #processing signup form
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render :new
        end
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def find_user
        
    end

end