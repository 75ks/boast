class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      flash[:notice] = "コメントが完了しました"
      redirect_to post_path(@comment.post.id)
    else
      flash.now[:alert] = "コメントに失敗しました"
      render post_path(@comment.post.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
