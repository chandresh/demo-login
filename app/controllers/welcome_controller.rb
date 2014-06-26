class WelcomeController < ApplicationController

  skip_before_action  :authenticate_user

  def index
    if session[:user_id].present?
      @user = User.find(session[:user_id]).name
    end
  end
end
