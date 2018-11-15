class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @user = User.find_by(username: session[:username])
  end
  
  def logged_in?
    if current_user
      true
    else
      false
    end
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

  def authorized_for_user(user)
    authorized
    if current_user != user
      redirect_to current_user
    end
  end

  def redirect_bad_route
    redirect_to users_path
  end

end
