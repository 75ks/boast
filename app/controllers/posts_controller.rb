class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      flash[:notice] = "投稿が完了しました"
      redirect_to root_path
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def destroy
    if @post.destroy
      flash[:notice] = "削除が完了しました"
      redirect_to root_path
    else
      flash.now[:alert] = "削除に失敗しました"
      render :show
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "編集が完了しました"
      redirect_to post_path(@post.id)
    else
      flash.now[:alert] = "編集に失敗しました"
      render :edit
    end
  end

  def search
    @posts = Post.search(params[:gender_id]).page(params[:page]).per(5)
  end

  private

  def post_params
    params.require(:post).permit(:text, images: []).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def correct_user
    unless user_signed_in? && current_user.id == @post.user.id
      redirect_to root_path
    end
  end
end
