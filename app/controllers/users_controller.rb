class UsersController < ApplicationController
  before_action :require_login

  def index
    current_user
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:username] = @user.username
      redirect_to users_path
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :username, :email)
    end

    def require_login
      redirect_to login_path unless session.include? :username
    end
end
