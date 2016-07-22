class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      render json: { body: @comment.body, user: current_user}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
