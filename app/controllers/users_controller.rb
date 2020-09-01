class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def show
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

  def edit
  end

  def update
    if @user.update
      flash[:notice] = "編集が完了しました"
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "編集に失敗しました"
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    unless user_signed_in? && current_user.id == @user.id
      redirect_to root_path
    end
  end
end
