class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]
  before_action :find_user, only: [:show, :edit, :update, :destroy, :activity]

  def index
    current_user
    @posts = current_user.feed_posts
  end

  def show
  end

  def new
    if logged_in?
      redirect_to users_path
    else
    @user = User.new
    render :new
    end
  end

  def create
    @user = User.new(user_params)
    placeholder_avatar
    if @user.save
      session[:username] = @user.username
      redirect_to users_path
    else
      render :new
    end
  end

  def activity
    authorized_for_user(@user)
  end

  def edit
    authorized_for_user(@user)
  end

  def update
    @user.update(user_params)
    update_avatar
    if @user.save
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    authorized_for_user(@user)
    @user.destroy
    session.clear
    redirect_to new_user_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :username, :email, :password, :avatar, :bio)
    end

    def require_login
      redirect_to login_path unless session.include? :username
    end

    def find_user
      @user = User.find(params[:id])
    end

    def placeholder_avatar
      if !params[:avatar]
        @user.avatar.attach(io: File.open('app/assets/images/placeholder.png'), filename: 'placeholder.png', content_type: 'image/png')
      end
    end

    def update_avatar
      if params[:avatar]
        @user.avatar.purge
        @user.avatar.attach(params[:avatar])
      end
    end

end
