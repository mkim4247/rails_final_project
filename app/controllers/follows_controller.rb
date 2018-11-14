class FollowsController < ApplicationController

  def create
    follow = Follow.new(follow_params)
    follow.user_id = current_user.id
    follow.save
    redirect_to users_path
  end

  def destroy
    follow = Follow.find(params[:id])
    following = follow.following
    follow.destroy
    redirect_to following
  end

  private

  def follow_params
    params.require(:follow).permit(:user_id, :following_id)
  end

end
