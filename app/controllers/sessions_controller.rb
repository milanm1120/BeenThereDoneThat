class SessionsController < ApplicationController
  def new     #will render the login form
  end

  def create  #processing the login form
    @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Login failed. Please login or sign up."
            redirect_to '/login'
        end
  end

  def destroy
    session.delete :user_id
  end
end
