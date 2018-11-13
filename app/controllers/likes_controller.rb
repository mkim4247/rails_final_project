class LikesController < ApplicationController

  def create
    like = Like.find_or_create_by(like_params)
    like.user_id = current_user.id
    like.save
    redirect_to like.post
  end

  def destroy
    like = Like.find_by(params[:id])
    post = like.post
    like.destroy
    redirect_to post
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
