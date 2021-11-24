class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def show
        
    end

    def create
        @user = User.new(user_params)
        byebug
        # if @user.save
        #     session[:user_id] = @user.id            #sessions[:user_id] is used to login
        #     redirect_to user_path(@user)
        # else
        #     render :new
        # end
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

end