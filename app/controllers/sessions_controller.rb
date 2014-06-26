class SessionsController < ApplicationController

  skip_before_action  :authenticate_user

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user and user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to :root, notice: "Successfully logged in"
    else
      redirect_to :root, notice: "Wrong Username or Password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root, notice: "Logged out Successfully"
  end
end
