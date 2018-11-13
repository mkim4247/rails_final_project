class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    session[:username] = @user.username
    redirect_to users_path
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
