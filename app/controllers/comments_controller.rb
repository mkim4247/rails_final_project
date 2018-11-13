class CommentsController < ApplicationController

  def create
    # byebug
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    if comment.save
      redirect_to comment.post
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

end
