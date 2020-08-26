class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:text, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
