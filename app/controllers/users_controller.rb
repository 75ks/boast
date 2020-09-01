class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @gender = user.gender.name
    @posts = user.posts
  end

  def destroy
    
  end

  def edit

  end

  def update

  end
end
