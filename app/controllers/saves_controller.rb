class SavesController < ApplicationController

  def create
    save = Save.create(save_params)
    save.user_id = current_user.id
    redirect_to save.post
  end

  private

  def save_params
    params.require(:save).permit(:user_id, :post_id)
  end

end
