class SessionsController < ApplicationController
  def new     #will render the login form, not creating a new object(user), this is to sign-in an existing user.
  end

  def create  #processing the login form
    user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Login failed. Please login or sign up."
            render :new
        end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end
