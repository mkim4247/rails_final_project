class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to users_path
    else
      render :new
    end
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:username] = @user.username
      redirect_to users_path
    else
      flash[:notice] = "Incorrect username/password combo."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
