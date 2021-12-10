class UsersController < ApplicationController
    before_action :find_user, except: [:new, :show, :create]

    def new                     #render a signup form
        @user = User.new
    end

    def show
        @pins = Pin.all
    end

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
    end

    def update
        @user.update(user_params)
        if @user.valid?
            redirect_to users_path(@user)
        else
            render 'user/#{@user.id}/edit'
        end
    end

    def destroy
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