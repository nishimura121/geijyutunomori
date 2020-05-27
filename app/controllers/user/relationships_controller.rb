class User::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def follower
    user = User.find(params[:id])
    @users = user.following_user.page(params[:page]).per(10)
    @items = Item.where(user_id: user.id)
  end

  def followed
    user = User.find(params[:id])
    @users = user.follower_user.page(params[:page]).per(10)
  end
end
