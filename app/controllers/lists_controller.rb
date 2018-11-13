class ListsController < ApplicationController

  def create
    list = List.find_or_create_by(list_params)
    list.user_id = current_user.id
    list.save
    redirect_to list.post
  end

  def destroy
    list = List.find_by(params[:id])
    post = list.post
    list.destroy
    redirect_to post
  end

  private

  def list_params
    params.require(:list).permit(:user_id, :post_id)
  end

end
