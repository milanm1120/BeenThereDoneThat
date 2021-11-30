class SessionsController < ApplicationController

  def new     #will render the login form, not creating a new object(user), this is to sign-in an existing user.
    if logged_in?
      redirect_to root_path
    end
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

  def omniauth
    user = User.find_or_create_by(uid: auth['uid']) do |u|            #auth is a private method
        u.first_name = auth['info']['first_name']
        u.last_name = auth['info']['last_name']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex(20)
      end
      if user.valid?
          session[:user_id] = user.id
          flash[:message] = "Successful Login!"
          redirect_to destinations_path
      else
          redirect_to destinations_path
      end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

    def  auth
        request.env['omniauth.auth']
    end

end
