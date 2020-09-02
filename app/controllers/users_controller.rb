class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :edit, :update]

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

  private

  def set_user
    @user = User.find(params[:id])
  end
end
