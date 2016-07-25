class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      render json: { body: @comment.body, user: current_user, id: @comment.id}
    end
  end

  def destroy
    Comment.destroy(params[:id])
    render json: {}
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
