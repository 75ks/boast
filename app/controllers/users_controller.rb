class UsersController < ApplicationController
  before_action :set_user

  def show
    @user_posts = @user.posts.order("created_at DESC").page(params[:page]).per(5)
  end

  def destroy
    if @user.destroy
      flash[:notice] = "削除が完了しました"
      redirect_to root_path
    else
      flash.now[:alert] = "削除に失敗しました"
      render :show
    end
  end

  def likes
    @user_posts = @user.favorite_posts.order("created_at DESC").page(params[:page]).per(5)
  end

  def follows
    @follows = @user.followings.page(params[:page]).per(10)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
