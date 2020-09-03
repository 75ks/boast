class FavoritesController < ApplicationController
  before_action :set_post, only: [:show, :create, :destroy]

  def show

  end

  def create
    @favorite = Favorite.new(user_id: current_user.id, post_id: @post.id)
    if @favorite.valid?
      @favorite.save
      redirect_to root_path
    else
      @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(5)
      render template: "posts/index"
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
    if @favorite
      @favorite.destroy
      redirect_to root_path
    else
      @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(5)
      render template: "posts/index"
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
