class FollowsController < ApplicationController

  def create
    follow = Follow.create(follow_params)
    follow.following_id = current_user.id
    follow.save
    redirect_to follow.following
  end

  def destroy
    follow = Follow.find_by(params[:id])
    following = follow.following
    follow.destroy
    redirect_to following
  end

  private

  def follow_params
    params.require(:follow).permit(:user_id, :following_id)
  end

end
