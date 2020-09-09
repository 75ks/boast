class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      flash[:notice] = "コメントが完了しました"
      redirect_to post_path(@comment.post.id)
    else
      flash.now[:alert] = "コメントに失敗しました"
      @post = Post.find(params[:post_id])
      render template: "posts/show"
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    if @comment.destroy
      flash[:notice] = "削除が完了しました"
      redirect_to post_path(@comment.post.id)
    else
      flash.now[:alert] = "削除に失敗しました"
      render template: "posts/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
