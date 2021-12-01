class UsersController < ApplicationController

    # def index
    #     @users = User.all
    # end

    def new                     #render a signup form
        if !logged_in?
            @user = User.new
        else
            redirect_to root_path
        end
    end

    # def show
    # end

    def create                  #processing signup form
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit
        find_user
    end

    def update
        find_user
        @user.update(user_params)
        if @user.valid?
            redirect_to users_path(@user)
        else
            render 'user/#{@user.id}/edit'
        end
    end

    def destroy
        find_user
        @user.destroy
            redirect_to root_path
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def find_user
        @user = User.find_by_id(params[:id])
    end

end