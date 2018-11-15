class PostsController < ApplicationController
  before_action :require_login
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def show
    if !@post
      redirect_to users_path
    end
  end

  def edit
    authorized_for_user(@post.user)
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    authorized_for_user(@post.user)
    @post.destroy
    redirect_to users_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :photo_url, :address, :avatar)
  end

  def require_login
    redirect_to login_path unless session.include? :username
  end

  def find_post
    @post = Post.find_by(id: params[:id])
  end

end
