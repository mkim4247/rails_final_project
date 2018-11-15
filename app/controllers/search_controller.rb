class SearchController < ApplicationController

  def search
    @users = User.search(params[:search])
    @posts = Post.search(params[:search])
  end


end
